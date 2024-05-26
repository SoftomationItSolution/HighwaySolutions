import os
import threading
import time
import cv2
from utils.constants import Utilities
from utils.log_master import CustomLogger
from pubsub import pub

class CameraHandler(threading.Thread):
    def __init__(self, handler,default_directory,camera_name,log_file_name,equipment,topic, gstream_enabled=False, retry_delay=5):
        super().__init__()
        self.handler=handler
        self.cam_details=equipment
        self.rtsp_url = equipment['UrlAddress']
        self.gstream_enabled = gstream_enabled
        self.retry_delay = retry_delay
        self.camera_name=camera_name
        self.topic=topic
        self.is_running=True
        self.capture_frame=False
        self.capture_is_open=False
        self.recording=False
        self.runtime_screenshort=False
        self.total_retries=0
        self.current_frame=None
        self.recording_thread=None
        self.set_logger(default_directory,log_file_name)
        self.set_cam_file_path_dir(default_directory)

    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname=f"CameraHandler-{self.camera_name}"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def set_cam_file_path_dir(self,default_directory):
        try:
            self.file_path_dir=os.path.join(default_directory, 'Events', 'camera',self.camera_name)
            Utilities.make_dir(self.file_path_dir)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_cam_file_path_dir: {str(e)}")

    def publish_data(self,data):
        try:
            if self.topic:
                pub.sendMessage(self.topic, liveview=data)
                pass
        except Exception as e:
            pass

    def initialize_capture(self):
        try:
            if self.gstream_enabled:
                gstreamer_pipeline = f"rtspsrc location={self.rtsp_url} latency=0 ! queue ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! videoconvert ! video/x-raw,format=BGRx ! appsink drop=1"
                return cv2.VideoCapture(gstreamer_pipeline, cv2.CAP_GSTREAMER)
            else:
                return cv2.VideoCapture(self.rtsp_url, cv2.CAP_FFMPEG)
            
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} initialize_capture: {str(e)}")
            self.handler.update_equipment_list(self.cam_details["EquipmentId"],'ConnectionStatus',False)
    
    def capture_open(self):
        try:
            if self.capture.isOpened():
                self.capture_is_open=True
                self.handler.update_equipment_list(self.cam_details["EquipmentId"],'ConnectionStatus',True)
            else:
                self.handler.update_equipment_list(self.cam_details["EquipmentId"],'ConnectionStatus',False)
                self.logger.logInfo(f"Retry/{self.rtsp_url} {self.total_retries}: Connection failed. Retrying in {self.retry_delay} seconds...")
                self.total_retries += 1
                time.sleep(self.retry_delay)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} capture_open: {str(e)}")
            self.handler.update_equipment_list(self.cam_details["EquipmentId"],'ConnectionStatus',False)

    def get_frame(self):
        try:
            ret, frame = self.capture.read()
            if ret:
                self.current_frame=frame
                self.publish_data(frame)
            else:
                self.capture.release()
                self.capture_frame = False
                self.current_frame=None
                self.capture_is_open=False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} capture_frame: {str(e)}")

    def run(self):
        while self.is_running:
            if not self.capture_frame:
                self.capture = self.initialize_capture()
                self.capture_frame = True
                self.capture_open()
            elif not self.capture_is_open:
                self.capture_open()
            elif self.capture_frame and self.capture_is_open:
                
                self.get_frame()
            time.sleep(0.01)  

    def take_screenshot(self, output_file):
        result=False
        try:
            if output_file.endswith(".jpg"):
                output_file=output_file
            else:
                output_file=output_file+".jpg"
            snapshot_file_path = os.path.join(self.file_path_dir, output_file)
            if self.capture_frame and self.capture_is_open:
                while True:
                    if self.current_frame is not None and self.current_frame.shape[0] > 0 and self.current_frame.shape[1] > 0:
                        cv2.imwrite(snapshot_file_path, self.current_frame)
                        result=True
                        break
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} take_screenshot: {str(e)}")
        finally:
            return result
        
    def record_video(self,output_file, duration=10, snapshot=False):
        try:
            if self.recording:
                self.logger.logInfo("Already recording. Stop the current recording before starting a new one.")
                self.stop_recording()
                #return False
            if duration==0:
                duration=5
            self.recording = True
            img_file_name=output_file+".jpg"
            video_file_name=output_file+".mp4"
            record_file_path = os.path.join(self.file_path_dir, video_file_name)
            image_file_path = os.path.join(self.file_path_dir, img_file_name)
            if self.capture_frame and self.capture_is_open:
                self.recording_thread = threading.Thread(target=self._record_video, args=(record_file_path,image_file_path, duration, snapshot))
                self.recording_thread.start()
                return True
            else:
                return False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} record_video: {str(e)}")
            return False

    def _record_video(self, record_file_path,image_file_path, duration, snapshot):
        start_time = None
        my_writer = None
        snapshot_done = False
        try:
            while self.recording:
                if self.recording==False:
                    if my_writer is not None:
                        my_writer.release()
                    break
                if self.current_frame is not None and self.current_frame.shape[0] > 0 and self.current_frame.shape[1] > 0:
                    if my_writer is None:
                        my_writer = self.writer_init(self.current_frame, record_file_path)
                    if my_writer is not None:
                        if not snapshot_done and snapshot:
                            cv2.imwrite(image_file_path, self.current_frame)
                            snapshot_done = True
                        if self.runtime_screenshort:
                            cv2.imwrite(image_file_path, self.current_frame)
                            self.runtime_screenshort=False
                        my_writer.write(self.current_frame)
                        if start_time is None:
                            start_time = cv2.getTickCount()
                if start_time is not None:
                    current_time = cv2.getTickCount()
                    elapsed_time = (current_time - start_time) / cv2.getTickFrequency()
                    if elapsed_time >= duration:
                        if my_writer is not None:
                            my_writer.release()
                        break
            if my_writer is not None:
                my_writer.release()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} _record_video: {str(e)}")
            if my_writer is not None:
                my_writer.release()
        finally:
            self.recording = False
            if my_writer is not None:
                my_writer.release()

    def writer_init(self, frame, output_file):
        try:
            frame_height, frame_width, _ = frame.shape
            #fourcc = cv2.VideoWriter_fourcc(*'XVID')
            fourcc = cv2.VideoWriter_fourcc(*'mp4v')
            out = cv2.VideoWriter(output_file, fourcc, 25.0, (frame_width, frame_height))
            return out
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} writer_init: {str(e)}")

    def stop_recording(self,snapshot=False):
        try:
            if self.recording_thread is not None:
                self.runtime_screenshort=snapshot
                self.recording = False
                self.recording_thread.join()
                self.recording_thread = None
                return True
            else:
                return False
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop_recording: {str(e)}")
            return False
        finally:
            return True
        
    def stop(self):
        try:
            self.stop_recording(False)
            self.is_running = False
            self.join()  
            if self.capture_frame:
                self.capture.release()
            self.capture_frame=False
            self.capture_is_open=False
            self.recording=False
            self.runtime_screenshort=False
            self.total_retries=0
            return True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} stop: {str(e)}")
            return False