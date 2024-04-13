import os
import cv2
import time
from threading import Thread

from utils.log_master import CustomLogger

class RTSPVideoCapture:
    def __init__(self, config_manager,log_file_name,rtsp_url, gstream_enabled=False, retry_delay=10):
        self.logger = CustomLogger(config_manager,log_file_name)
        self.rtsp_url = rtsp_url
        self.gstream_enabled = gstream_enabled
        self.retry_delay = retry_delay
        self.online = False
        self.total_retries = 1
        self.capture = None
        self.recording = False
        self.recording_thread = None
        self.directory = self.create_directory()

    def create_directory(self):
        directory = os.path.join(os.getcwd(), 'recordings')
        if not os.path.exists(directory):
            os.makedirs(directory)
        return directory

    def start_capture(self):
        while True:
            if not self.online:
                while True:
                    self.capture = self.initialize_capture()
                    if self.capture.isOpened():
                        self.online = True
                        self.total_retries = 1
                        break
                    self.logger.logInfo(f"Retry/{self.rtsp_url} {self.total_retries}: Connection failed. Retrying in {self.retry_delay} seconds...")
                    self.total_retries += 1
                    time.sleep(self.retry_delay)

            if self.online:
                ret, frame = self.capture.read()
                if ret:
                    yield frame
                else:
                    self.capture.release()
                    self.online = False

            key = cv2.waitKey(1) & 0xFF
            if key == ord('q'):
                break

        if self.capture is not None:
            self.capture.release()

    def initialize_capture(self):
        if self.gstream_enabled:
            gstreamer_pipeline = f"rtspsrc location={self.rtsp_url} latency=0 ! queue ! rtph264depay ! h264parse ! nvv4l2decoder ! nvvidconv ! videoconvert ! video/x-raw,format=BGRx ! appsink drop=1"
            return cv2.VideoCapture(gstreamer_pipeline, cv2.CAP_GSTREAMER)
        else:
            return cv2.VideoCapture(self.rtsp_url, cv2.CAP_FFMPEG)
        
    def take_screenshot(self, output_file):
        frame = self.capture.read()[1]
        if frame is not None:
            snapshot_file_path = os.path.join(self.directory, output_file)
            cv2.imwrite(snapshot_file_path, frame)
            print(f"Screenshot saved: {snapshot_file_path}")
            return True
        else:
            print("Error: Unable to capture frame.")
            return False

    def record_video(self, output_file="output.mp4", duration=10, snapshot=False):
        if self.recording:
            self.logger.logInfo("Already recording. Stop the current recording before starting a new one.")
            return

        self.recording = True
        frame_generator = self.start_capture()
        self.recording_thread = Thread(target=self._record_video, args=(frame_generator, output_file, duration, snapshot))
        self.recording_thread.start()

    def writer_init(self, frame, output_file):
        frame_height, frame_width, _ = frame.shape
        fourcc = cv2.VideoWriter_fourcc(*'XVID')
        file_path = os.path.join(self.directory, f"{output_file}.mp4")
        out = cv2.VideoWriter(file_path, fourcc, 25.0, (frame_width, frame_height))
        return out

    def _record_video(self, frame_generator, output_file, duration, snapshot):
        if duration == 0:
            duration = 60
        start_time = None
        my_writer = None
        snapshot_done = False
        try:
            for frame in frame_generator:
                if frame is not None and frame.shape[0] > 0 and frame.shape[1] > 0:
                    if my_writer is None:
                        my_writer = self.writer_init(frame, output_file)

                    if not snapshot_done and snapshot:
                        snapshot_file_path = os.path.join(self.directory, f"{output_file}.jpg")
                        cv2.imwrite(snapshot_file_path, frame)
                        snapshot_done = True
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
            self.logger.logError(f"Error occurred _record_video: {str(e)}")
            if my_writer is not None:
                my_writer.release()
            cv2.destroyAllWindows()
        finally:
            self.recording = False

    def stop_recording(self):
        if self.recording_thread is not None:
            self.recording = False
            self.recording_thread.join()
            self.recording_thread = None

    def stop_capture(self):
        if self.capture is not None:
            self.capture.release()