from datetime import datetime
import os
import cv2
import time
import threading
from vidgear.gears import CamGear, WriteGear
from collections import deque
from log.log_master import CustomLogger
from utils.constants import Utilities

class IpCameraHandler(threading.Thread):
    def __init__(self,handler,default_directory,camera_name,log_file_name,equipment,topic,cam_config,duration=10,retry_delay=1,timeout=0.100):
        super().__init__()
        self.handler=handler
        self.cam_details=equipment
        self.cam_config=cam_config
        self.rtsp_url = equipment['UrlAddress']
        self.retry_delay = retry_delay
        self.timeout = timeout
        self.camera_name=camera_name
        self.topic=topic
        self.duration=duration
        self.is_stopped=False
        self.is_active=True
        self.recording=False
        self.recording_thread=None
        self.stream_online = False
        self.stream = None
        self.writer = None
        self.last_frame = None
        self.frame_rate = None
        self.frame_deque = deque(maxlen=10)
        self.record_file_path=''
        self.image_file_path=''
        self.record_time_out=0
        self.last_frame_dt=None
        self.set_logger(default_directory,log_file_name)
        self.set_cam_file_path_dir()


    def set_logger(self,default_directory,log_file_name):
        try:
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} set_logger: {str(e)}")

    def set_cam_file_path_dir(self):
        try:
            self.record_time_out = (int)(self.cam_config["file_path"])
            self.file_path_dir=os.path.join(self.cam_config["file_path"],self.camera_name)
            Utilities.make_dir(self.file_path_dir)
        except Exception as e:
            self.record_time_out=0
            self.logger.logError(f"Exception {self.camera_name} set_cam_file_path_dir: {str(e)}")

    
    def init_cam(self):
        try:
            self.stream = CamGear(source=self.rtsp_url, logging=False)
            self.stream.start()
            self.frame_rate = self.stream.stream.get(cv2.CAP_PROP_FPS)
            self.stream_online = True
            self.handler.update_equipment_list(self.cam_details["EquipmentId"],'OnLineStatus',True)
            self.handler.update_equipment_list(self.cam_details["EquipmentId"],'ConnectionStatus',True)
        except RuntimeError:
            self.stream_online = False
            self.handler.update_equipment_list(self.cam_details["EquipmentId"],'OnLineStatus',False)
            self.handler.update_equipment_list(self.cam_details["EquipmentId"],'ConnectionStatus',False)
            self.logger.logInfo(f"Retry/{self.rtsp_url}: Connection failed. Retrying in {self.retry_delay} seconds...")
            time.sleep(self.retry_delay)

    def run(self):
        while not self.is_stopped:
            try:
                while self.is_active:
                    self.init_cam()
                    while self.stream_online:
                        try:
                            frame = self.stream.read()
                            if frame is not None:
                                self.last_frame_dt=datetime.now()
                                self.last_frame = frame
                                self.frame_deque.append(frame)
                            else:
                                if self.last_frame_dt and (datetime.datetime.now() - self.last_frame_dt).total_seconds() > 1:
                                    self.last_frame = None
                                    self.frame_deque = deque(maxlen=10)
                                    self.stream_online = False
                                    self.handler.update_equipment_list(self.cam_details["EquipmentId"],'OnLineStatus',False)
                                    self.handler.update_equipment_list(self.cam_details["EquipmentId"],'ConnectionStatus',False)
                                    self.logger.logInfo(f"{self.camera_name} Warning: No new frame received for more than 1 second!")
                                    break
                            if not self.stream_online:
                                self.logger.logInfo(f"{self.camera_name} Camera is offline or not capturing frames")
                                break
                        except Exception as e:
                            self.logger.logError(f"Exception {self.camera_name} run: {str(e)}")
                time.sleep(self.retry_delay)
            except Exception as e:
                self.logger.logError(f"Exception {self.camera_name} run_main: {str(e)}")

    

    def get_image_path(self,img_file_name):
        try:
            return os.path.join(self.file_path_dir, img_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} update_image_path: {str(e)}")
            return None

    def start_recording(self, output_file,snapshot=False):
        try:
            if self.stream_online:
                img_file_name=output_file+".jpg"
                video_file_name=output_file+".mp4"
                self.record_file_path = os.path.join(self.file_path_dir, video_file_name)
                self.image_file_path = os.path.join(self.file_path_dir, img_file_name)
                output_params = {
                 "-input_framerate": str(self.frame_rate),
                "-vcodec": "libx264",  # Use H.264 codec for compatibility
                "-crf": 23,  # Constant Rate Factor, adjust for quality
                "-preset": "fast",  # Preset for encoding speed
                "-pix_fmt": "yuv420p"  # Pixel format for compatibility
                }
                self.writer = WriteGear(output=self.record_file_path, logging=True, **output_params)
                self.recording_thread = threading.Thread(target=self.record_thread, args=(snapshot,))
                self.recording_thread.start()
                return True
            else:
                self.logger.logInfo(f"{self.camera_name} Camera is offline or not capturing frames in start_recording")
                return False
        except Exception as e:
                self.logger.logError(f"Exception {self.camera_name} start_recording: {str(e)}")
                return False

    def record_thread(self,snapshot):
        if self.recording:
            self.logger.logInfo("Already recording. Stop the current recording before starting a new one.")
            self.stop_recording()
        if snapshot and self.image_file_path!='':
            self.take_screenshot(self.image_file_path)
        start_time = cv2.getTickCount()
        self.recording=True
        while self.recording:
            try:
                elapsed_time = (cv2.getTickCount() - start_time) / cv2.getTickFrequency()
                if elapsed_time >= self.duration:
                    self.take_screenshot(self.image_file_path)
                    break
                if len(self.frame_deque) == 0:
                    continue
                frame = self.frame_deque.popleft()
                if frame is not None and self.writer:
                    self.writer.write(frame)
                else:
                    self.logger.logInfo(f"{self.camera_name} Camera is offline or not capturing frames in record_thread")
                    break
            except Exception as e:
                self.logger.logError(f"Exception {self.camera_name} record_thread: {str(e)}")
        self.writer.close()

    def stop_recording(self,snapshot=False):
        try:
            if snapshot:
                self.take_screenshot(self.image_file_path)
            if self.writer:
                self.writer.close()
            self.recording=False
            self.frame_deque = deque(maxlen=10)
            if self.recording_thread is not None:
                self.recording_thread.join()
                self.recording_thread = None
                self.frame_deque = deque(maxlen=10)
                return True
            else:
                return False
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} stop_recording: {str(e)}")
            return False
        finally:
            self.record_file_path=''
            self.image_file_path=''
            return True
        
    def take_screenshot(self, output_file):
        try:
            if self.stream_online:
                if output_file.endswith(".jpg"):
                    output_file=output_file
                else:
                    output_file=output_file+".jpg"
                snapshot_file_path = os.path.join(self.file_path_dir, output_file)
                if self.last_frame is not None:
                    cv2.imwrite(snapshot_file_path, self.last_frame)
                    return True
                else:
                    self.logger.logInfo(f"{self.camera_name} Camera is offline or not capturing frames in take_screenshot")
                    return False
            else:
                self.logger.logInfo(f"{self.camera_name} stream is ofsline in take_screenshot")
                return False
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} take_screenshot: {str(e)}")
            return False

    def stop(self):
        try:
            self.is_stopped=False
            self.is_active=False
            if self.stream:
                self.stream_online = False
                time.sleep(.5)
                self.stream.stop()
            self.stop_recording()
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} stop: {str(e)}")