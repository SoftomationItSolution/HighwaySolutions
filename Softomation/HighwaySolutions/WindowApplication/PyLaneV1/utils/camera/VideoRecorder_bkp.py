import time
import cv2
from vidgear.gears import CamGear, WriteGear
from collections import deque
import threading

class VideoRecorder_bkp:
    def __init__(self, rtsp_url):
        self.rtsp_url = rtsp_url
        self.stream = None
        self.writer = None
        self.last_frame = None
        self.frame_rate = None
        self.stream_online = False
        self.frame_deque = deque(maxlen=10)

    def init_cam(self):
        while True:
            try:
                self.stream = CamGear(source=self.rtsp_url, logging=False).start()
                self.frame_rate = self.stream.stream.get(cv2.CAP_PROP_FPS)
                self.stream_online = True
                break
            except RuntimeError:
                self.stream_online = False
                print("Connection failed. Retrying in 10 seconds...")
                time.sleep(10)

    def capture_frames(self):
        self.init_cam()
        while self.stream_online:
            frame = self.stream.read()
            if frame is not None:
                self.last_frame = frame
                self.frame_deque.append(frame)
            if not self.stream_online:
                print("Camera is offline or not capturing frames")
                break

    def start_recording(self, output_file):
        if self.stream_online:
            output_params = {
                "-input_framerate": str(self.frame_rate),
                "-vcodec": "libx264",  # Use H.264 codec for compatibility
                "-crf": 23,  # Constant Rate Factor, adjust for quality
                "-preset": "fast",  # Preset for encoding speed
                "-pix_fmt": "yuv420p"  # Pixel format for compatibility
            }
            self.writer = WriteGear(output=output_file, logging=True, **output_params)
        else:
            print("Camera is offline or not capturing frames")

    def stop_recording(self):
        if self.writer:
            self.writer.close()

    def stop(self):
        if self.stream:
            self.stream_online = False
            time.sleep(.5)
            self.stream.stop()

        if self.writer:
            self.writer.close()

    def record(self, duration):
        start_time = cv2.getTickCount()
        while True:
            elapsed_time = (cv2.getTickCount() - start_time) / cv2.getTickFrequency()
            if elapsed_time >= duration:
                break
            if len(self.frame_deque) == 0:
                continue
            frame = self.frame_deque.popleft()
            if frame is not None:
                self.writer.write(frame)
            else:
                print("Camera is offline or not capturing frames")
                break
        self.writer.close()
       
    def save_frame(self, filename):
        if self.last_frame is not None:
            cv2.imwrite(filename, self.last_frame)
        else:
            print("Camera is offline or not capturing frames")

rtsp_url = "rtsp://admin:kits@2023@192.168.1.202:554"
recorder = VideoRecorder_bkp(rtsp_url=rtsp_url)
capture_thread = threading.Thread(target=recorder.capture_frames)
capture_thread.start()

time.sleep(2)

recorder.start_recording(output_file="output.mp4")
recorder.record(duration=10)
recorder.save_frame(filename="frame.jpg")

recorder.stop()
