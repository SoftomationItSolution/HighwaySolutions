import cv2
import time
from utils.log_master import CustomLogger

class CameraManager:
    def __init__(self,_handler,log_file_name):
        self.handler=_handler
        self.logger = CustomLogger(log_file_name)
        self.video_captures = {}

    def initialize_video_capture(self, rtsp_url, camera_ip):
        video_capture = cv2.VideoCapture(rtsp_url)
        if not video_capture.isOpened():
            self.logger.logError(f"Error opening camera {camera_ip}")
            return False
        self.video_captures[camera_ip] = video_capture
        return True

    def record_video(self, camera_ip, output_file="output.avi", duration=10):
        if camera_ip not in self.video_captures:
            self.logger.logError(f"Camera {camera_ip} not initialized")
            return

        video_capture = self.video_captures[camera_ip]
        fourcc = cv2.VideoWriter_fourcc(*'XVID')
        out = cv2.VideoWriter(output_file, fourcc, 20.0, (640, 480))
        start_time = time.time()
        while True:
            ret, frame = video_capture.read()
            if ret:
                out.write(frame)
                if time.time() - start_time >= duration:
                    break
            else:
                break

        video_capture.release()
        out.release()
        cv2.destroyAllWindows()

    def take_snapshot(self, camera_ip, output_file="snapshot.jpg"):
        if camera_ip not in self.video_captures:
            self.logger.logError(f"Camera {camera_ip} not initialized")
            return False

        video_capture = self.video_captures[camera_ip]
        ret, frame = video_capture.read()
        if ret:
            timestamp = time.strftime("%Y%m%d-%H%M%S")
            output_file = f"snapshot_{camera_ip}_{timestamp}.jpg"
            cv2.imwrite(output_file, frame)
            return True
        else:
            self.logger.logError(f"Error capturing frame from camera {camera_ip}")
            return False

# if __name__ == "__main__":
#     camera_manager = CameraManager()
#     rtsp_urls = {
#         1: "rtsp://your_rtsp_url_1",
#         2: "rtsp://your_rtsp_url_2"
#     }

#     for camera_ip, rtsp_url in rtsp_urls.items():
#         camera_manager.initialize_video_capture(rtsp_url, camera_ip)

#     for camera_ip in rtsp_urls.keys():
#         camera_manager.record_video(camera_ip)
#         camera_manager.take_snapshot(camera_ip)
