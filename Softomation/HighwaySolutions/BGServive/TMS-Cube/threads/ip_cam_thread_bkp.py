import os
import cv2
import time
import threading
from vidgear.gears import CamGear, WriteGear
from collections import deque
from log.log_master import CustomLogger
#from threads.lane_bg_process import LaneBGProcess
from utils.constants import Utilities


class IpCameraHandlerBKP(threading.Thread):
    def __init__(self, handler, default_directory, camera_name,log_file_name, equipment,cam_config, retry_delay=2):
        super().__init__(daemon=True)
        self.handler = handler
        self.cam_details = equipment
        
        self.rtsp_url = equipment['UrlAddress']
        self.retry_delay = retry_delay
        self.camera_name = camera_name
        self.record_timeout=5
        self.default_fps = 25
        self.force_fps = True

        # Flags
        self.is_stopped = False
        self.stream_online = False
        self.recording = False

        # Stream
        self.stream = None
        self.last_frame = None
        self.frame_rate = 25
        self.frame_lock = threading.Lock()
        self.frame_deque = deque(maxlen=30)

        # Writer
        self.writer = None
        self.recording_thread = None
        self.record_file_path = ''
        self.image_file_path = ''

        # Setup dirs + logger
        self.set_logger(default_directory, log_file_name)
        self.set_cam_config(cam_config)
        self.set_cam_file_path_dir(default_directory)

    # ---------------------------------------------------------
    def set_logger(self, default_directory, log_file_name):
        try:
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Logger init failed for {self.camera_name}: {e}")

    def set_cam_config(self, cam_config):
        try:
            self.cam_config=cam_config
            if cam_config:
                self.record_timeout=cam_config["timeout"]
                self.default_fps=cam_config["FPS"]
                self.frame_rate=self.default_fps
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} set_cam_config: {str(e)}")
        finally:
            self.logger.logInfo(f"{self.camera_name} record_timeout:{self.record_timeout} ,default_fps:{self.default_fps},frame_rate:{self.frame_rate}")

    def set_cam_file_path_dir(self, default_directory):
        try:
            self.file_path_dir = os.path.join(default_directory, 'Events', 'camera', self.camera_name)
            Utilities.make_dir(self.file_path_dir)
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} set_cam_file_path_dir: {str(e)}")

    def get_image_path(self,img_file_name):
        try:
            return os.path.join(self.file_path_dir, img_file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} update_image_path: {str(e)}")
            return None
    # ---------------------------------------------------------
    def init_cam(self):
        try:
            if self.stream:
                self.stream.stop()
                self.stream = None

            self.stream = CamGear(source=self.rtsp_url, logging=True).start()
            fps = self.stream.stream.get(cv2.CAP_PROP_FPS)

            if self.force_fps or not fps or fps <= 0:
                self.frame_rate = self.default_fps
            else:
                self.frame_rate = int(fps)

            self.stream_online = True
            if self.handler:
                self.handler.update_equipment_list(self.cam_details["EquipmentId"], 'OnLineStatus', True)
                self.handler.update_equipment_list(self.cam_details["EquipmentId"], 'ConnectionStatus', True)
            self.logger.logInfo(f"{self.camera_name} connected with FPS={self.frame_rate}")
        except Exception as e:
            self.stream_online = False
            if self.handler:
                self.handler.update_equipment_list(self.cam_details["EquipmentId"], 'OnLineStatus', False)
                self.handler.update_equipment_list(self.cam_details["EquipmentId"], 'ConnectionStatus', False)
            self.logger.logInfo(f"{self.camera_name} retry: {e}, reconnecting in {self.retry_delay}s")
            time.sleep(self.retry_delay)

    def run(self):
        while not self.is_stopped:
            try:
                if not self.stream_online:
                    self.init_cam()

                while self.stream_online and not self.is_stopped:
                    frame = None
                    try:
                        frame = self.stream.read()
                    except Exception as e:
                        self.logger.logError(f"{self.camera_name} stream read error: {e}")

                    if frame is None:
                        self.logger.logInfo(f"{self.camera_name} lost connection, retrying...")
                        self.stream.stop()
                        self.stream_online = False
                        break

                    # Update frame buffer
                    with self.frame_lock:
                        self.last_frame = frame
                        self.frame_deque.append(frame)

                    time.sleep(0.01)

                time.sleep(self.retry_delay)

            except Exception as e:
                self.logger.logError(f"Exception {self.camera_name} run_main: {str(e)}")
                self.stream_online = False
                time.sleep(self.retry_delay)

    # ---------------------------------------------------------
    # 1) ON DEMAND SCREENSHOT
    def get_screenshot(self, output_file=None):
        try:
            if self.last_frame is not None:
                if output_file.endswith(".jpg"):
                    output_file=output_file
                else:
                    output_file=output_file+".jpg"
                snapshot_file_path = os.path.join(self.file_path_dir, output_file)
                with self.frame_lock:
                    cv2.imwrite(snapshot_file_path, self.last_frame)
                return snapshot_file_path
            else:
                self.logger.logInfo(f"{self.camera_name} no frame for screenshot")
                return None
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} get_screenshot: {str(e)}")
            return None

    # ---------------------------------------------------------
    # 2) ON DEMAND RECORDING
    def start_recording(self, output_file, duration=5, screenshot_mode=None):
        try:
            if not self.stream_online:
                self.logger.logInfo(f"{self.camera_name} Camera offline in start_recording")
                return False
            
            img_file_name = output_file + ".jpg"
            video_file_name = output_file + ".mp4"
            record_file_path = os.path.join(self.file_path_dir, video_file_name)
            image_file_path = os.path.join(self.file_path_dir, img_file_name)
            os.makedirs(os.path.dirname(record_file_path), exist_ok=True)

            if screenshot_mode in ("start", "both"):
                self.get_screenshot(image_file_path)

            output_params = {
                "-vcodec": "libx264",
                "-crf": "28",
                "-preset": "fast",
                "-pix_fmt": "yuv420p",
                "-r": str(self.frame_rate)
            }

            # Initialize independent writer
            try:
                writer = WriteGear(
                    output=record_file_path,
                    compression_mode=True,
                    logging=True,
                    **output_params
                )
            except Exception as e:
                self.logger.logError(f"{self.camera_name} WriteGear init failed: {str(e)}")
                return False

            total_frames = int(self.frame_rate * self.record_timeout)

            # Run recording in its own thread with isolated writer
            threading.Thread(
                target=self.record_loop,
                args=(writer, total_frames, image_file_path, screenshot_mode),
                daemon=True
            ).start()

            return True
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} start_recording: {str(e)}")
            return False

    def record_loop(self, writer, total_frames, image_file_path, screenshot_mode):
        written_frames = 0
        try:
            while written_frames < total_frames:
                frame = None
                with self.frame_lock:
                    if self.frame_deque:
                        frame = self.frame_deque.popleft()

                if frame is not None:
                    writer.write(frame)
                    written_frames += 1
                else:
                    time.sleep(0.01)

            # Screenshot at end
            if screenshot_mode in ("end", "both") and image_file_path:
                self.get_screenshot(image_file_path)

        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} record_loop: {str(e)}")
        finally:
            writer.close()
    
    
    # def start_recording(self, output_file, duration=5, screenshot_mode=None):
    #     try:
    #         if not self.stream_online:
    #             self.logger.logInfo(f"{self.camera_name} Camera offline in start_recording")
    #             return False
            
    #         img_file_name=output_file+".jpg"
    #         video_file_name=output_file+".mp4"
    #         self.record_file_path = os.path.join(self.file_path_dir, video_file_name)
    #         self.image_file_path = os.path.join(self.file_path_dir, img_file_name)
    #         os.makedirs(os.path.dirname(self.record_file_path), exist_ok=True)
    #         os.makedirs(os.path.dirname(self.image_file_path), exist_ok=True)
    #         if screenshot_mode in ("start", "both"):
    #             self.get_screenshot(self.image_file_path)

    #         output_params = {
    #             "-vcodec": "libx264",   # video codec
    #             "-crf": "28",           # quality (lower = better quality, larger file)
    #             "-preset": "fast",      # encoding speed/efficiency tradeoff
    #             "-pix_fmt": "yuv420p",  # pixel format for compatibility
    #             "-r": str(self.frame_rate)  # output frame rate
    #         }

    #         try:
    #             self.writer = WriteGear(
    #                 output=self.record_file_path,   # ✅ correct for new versions
    #                 compression_mode=True,          # important for ffmpeg backend
    #                 logging=True,
    #                 **output_params
    #             )

    #         except Exception as e:
    #             self.logger.logError(f"{self.camera_name} WriteGear initialization failed: {str(e)}")
    #             self.writer = None
    #             return False

    #         self.recording = True

    #         total_frames = int(self.frame_rate * self.record_timeout)

    #         self.recording_thread = threading.Thread(target=self.record_loop, args=(total_frames, screenshot_mode), daemon=True)
    #         self.recording_thread.start()
    #         return True
    #     except Exception as e:
    #         self.logger.logError(f"Exception {self.camera_name} start_recording: {str(e)}")
    #         return False

    # def record_loop(self, total_frames, screenshot_mode):
    #     written_frames = 0
    #     try:
    #         while self.recording and written_frames < total_frames:
    #             frame = None
    #             with self.frame_lock:
    #                 if self.frame_deque:
    #                     frame = self.frame_deque.popleft()

    #             if frame is not None:
    #                 self.writer.write(frame)
    #                 written_frames += 1
    #             else:
    #                 # If no frame available, wait but don't quit
    #                 time.sleep(0.01)

    #         # Screenshot at end
    #         if screenshot_mode in ("end", "both") and self.image_file_path:
    #             self.get_screenshot(self.image_file_path)

    #     except Exception as e:
    #         self.logger.logError(f"Exception {self.camera_name} record_loop: {str(e)}")
    #     finally:
    #         if self.writer:
    #             self.writer.close()
    #         self.recording = False
    #         self.writer = None
    #         self.record_file_path = ''
    #         self.image_file_path = ''


    # ---------------------------------------------------------
    def stop(self):
        try:
            self.is_stopped = True
            if self.stream:
                self.stream_online = False
                time.sleep(0.5)
                self.stream.stop()
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} stop: {str(e)}")
