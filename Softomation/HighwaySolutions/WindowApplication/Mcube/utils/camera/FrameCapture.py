import os
import cv2
import time
from pubsub import pub
from threading import Thread
from utils.constants import Utilities
from utils.log_master import CustomLogger

class RTSPVideoCapture:
    def __init__(self, default_directory,log_file_name,equipment,topic, gstream_enabled=False, retry_delay=10):
        self.equipment=equipment
        self.rtsp_url = equipment['UrlAddress']
        self.gstream_enabled = gstream_enabled
        self.retry_delay = retry_delay
        self.topic=topic
        self.total_retries = 1
        self.online = False
        self.recording = False
        self.runtime_screenshort = False
        self.capture_frame=True
        self.capture = None
        self.recording_thread = None
        self.img_file_name=None
        self.video_file_name=None
        self.folder_name=None
        self.set_logger(default_directory,log_file_name)
        self.set_cam_file_path_dir(default_directory)
        
    def set_logger(self,default_directory,log_file_name):
        try:
            self.classname="RTSPVideoCapture"
            self.logger = CustomLogger(default_directory,log_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_logger: {str(e)}")

    def set_cam_file_path_dir(self,default_directory):
        try:
            self.file_path_dir=os.path.join(default_directory, 'Events', 'camera')
            Utilities.make_dir(self.file_path_dir)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} set_cam_file_path_dir: {str(e)}")

    def initialize_capture(self):
        try:
            if self.gstream_enabled:
                gstreamer_pipeline = f"rtspsrc location={self.rtsp_url} latency=0 ! queue ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! videoconvert ! video/x-raw,format=BGRx ! appsink drop=1"
                return cv2.VideoCapture(gstreamer_pipeline, cv2.CAP_GSTREAMER)
            else:
                return cv2.VideoCapture(self.rtsp_url, cv2.CAP_FFMPEG)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} initialize_capture: {str(e)}")

    def start_capture(self,retry=True):
        try:
            self.capture_frame=True
            while self.capture_frame:
                if not self.online:
                    while True:
                        self.capture = self.initialize_capture()
                        if self.capture.isOpened():
                            self.online = True
                            self.capture_frame=False
                            self.total_retries = 1
                            break
                        if retry==False:
                            self.capture_frame=False
                            break
                        self.logger.logInfo(f"Retry/{self.rtsp_url} {self.total_retries}: Connection failed. Retrying in {self.retry_delay} seconds...")
                        self.total_retries += 1
                        time.sleep(self.retry_delay)
                if self.online:
                    ret, frame = self.capture.read()
                    if ret:
                        yield frame
                        if self.topic!='':
                           self.publish_data(frame)
                    else:
                        self.capture.release()
                        self.online = False
                key = cv2.waitKey(1) & 0xFF
                if key == ord('q'):
                    break
            if self.capture is not None:
                self.capture.release()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} start_capture: {str(e)}")

    
    def publish_data(self,data):
        try:
            pub.sendMessage(self.topic, liveview=data)
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} topic:{self.topic} publish_data: {str(e)}")

    def writer_init(self, frame, output_file):
        try:
            frame_height, frame_width, _ = frame.shape
            fourcc = cv2.VideoWriter_fourcc(*'XVID')
            out = cv2.VideoWriter(output_file, fourcc, 25.0, (frame_width, frame_height))
            return out
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} writer_init: {str(e)}")

    def take_only_screenshot(self, output_file,folder_name):
        result=False
        try:
            self.folder_name=folder_name
            self.img_file_name=output_file
            snapshot_file_dir=os.path.join(self.file_path_dir, folder_name)
            Utilities.make_dir(snapshot_file_dir)
            snapshot_file_path = os.path.join(snapshot_file_dir, output_file)
            frame_generator = self.start_capture(False)
            for frame in frame_generator:
                if frame is not None and frame.shape[0] > 0 and frame.shape[1] > 0:
                        cv2.imwrite(snapshot_file_path, frame)
                        result=True
                        break
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} take_only_screenshot: {str(e)}")
        finally:
            return result    
        
    def record_video(self,folder_name, output_file="output.avi", duration=10, snapshot=False):
        try:
            if self.recording:
                self.logger.logInfo("Already recording. Stop the current recording before starting a new one.")
                return False
            self.recording = True
            self.folder_name=folder_name
            self.img_file_name=output_file+".jpg"
            self.video_file_name=output_file+".avi"
            record_file_dir=os.path.join(self.file_path_dir, folder_name)
            Utilities.make_dir(record_file_dir)
            record_file_path = os.path.join(record_file_dir, self.video_file_name)
            image_file_path = os.path.join(record_file_dir, self.img_file_name)
            frame_generator = self.start_capture()
            self.recording_thread = Thread(target=self._record_video, args=(frame_generator, record_file_path,image_file_path, duration, snapshot))
            self.recording_thread.start()
            return True
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} record_video: {str(e)}")
            return False

    def _record_video(self, frame_generator, record_file_path,image_file_path, duration, snapshot):
        if duration == 0:
            duration = 5
        start_time = None
        my_writer = None
        snapshot_done = False
        try:
            for frame in frame_generator:
                if frame is not None and frame.shape[0] > 0 and frame.shape[1] > 0:
                    if my_writer is None:
                        my_writer = self.writer_init(frame, record_file_path)
                    if not snapshot_done and snapshot:
                        cv2.imwrite(image_file_path, frame)
                        snapshot_done = True
                    if self.runtime_screenshort:
                        cv2.imwrite(image_file_path, frame)
                        self.runtime_screenshort=False
                    my_writer.write(frame)
                    if start_time is None:
                        start_time = cv2.getTickCount()
                if start_time is not None:
                    current_time = cv2.getTickCount()
                    elapsed_time = (current_time - start_time) / cv2.getTickFrequency()
                    if elapsed_time >= duration:
                        break
            if my_writer is not None:
                my_writer.release()
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} _record_video: {str(e)}")
            if my_writer is not None:
                my_writer.release()
            cv2.destroyAllWindows()
        finally:
            self.recording = False

    def stop_recording(self,snapshot=False):
        try:
            if self.recording_thread is not None:
                if snapshot and self.folder_name is not None and self.img_file_name is not None:
                    self.runtime_screenshort=True
                self.recording = False
                self.recording_thread.join()
                self.recording_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} writer_init: {str(e)}")
        finally:
            return self.img_file_name

    def stop_capture(self):
        try:
            if self.capture is not None:
                self.capture.release()
            if self.recording_thread is not None:
                self.recording = False
                self.recording_thread.join()
                self.recording_thread = None
        except Exception as e:
            self.logger.logError(f"Exception {self.classname} writer_init: {str(e)}")
