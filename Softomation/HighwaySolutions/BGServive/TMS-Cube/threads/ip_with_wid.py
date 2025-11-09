import os
import cv2
import time
import threading
from collections import deque
from vidgear.gears import CamGear, WriteGear
from log.log_master import CustomLogger
from utils.constants import Utilities


class IpCameraHandler(threading.Thread):
    def __init__(self, handler, default_directory, camera_name, log_file_name, equipment, cam_config, retry_delay=2):
        super().__init__(daemon=True)
        self.handler = handler
        self.cam_details = equipment
        self.rtsp_url = equipment['UrlAddress']
        self.retry_delay = retry_delay
        self.camera_name = camera_name

        # Camera config
        self.record_timeout = cam_config.get("timeout", 5) if cam_config else 5
        self.default_fps = cam_config.get("FPS", 25) if cam_config else 25
        self.force_fps = True

        # State
        self.is_stopped = False
        self.stream_online = False

        # Stream + frame locks
        self.stream = None
        self.last_frame = None
        self.frame_rate = self.default_fps
        self.frame_lock = threading.Lock()

        # Active recordings list
        self.active_recordings = []  # each entry is dict with queue, writer, etc.

        # Setup dirs + logger
        self.set_logger(default_directory, log_file_name)
        self.set_cam_file_path_dir(default_directory)

    # ---------------------------------------------------------
    def set_logger(self, default_directory, log_file_name):
        try:
            self.logger = CustomLogger(default_directory, log_file_name)
        except Exception as e:
            print(f"Logger init failed for {self.camera_name}: {e}")

    def set_cam_file_path_dir(self, default_directory):
        try:
            self.file_path_dir = os.path.join(default_directory, 'Events', 'camera', self.camera_name)
            Utilities.make_dir(self.file_path_dir)
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} set_cam_file_path_dir: {str(e)}")

    def get_image_path(self, img_file_name):
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

            self.stream = CamGear(source=self.rtsp_url, logging=False).start()
            fps = self.stream.stream.get(cv2.CAP_PROP_FPS)

            self.frame_rate = self.default_fps if self.force_fps or not fps or fps <= 0 else int(fps)
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

    # ---------------------------------------------------------
    def run(self):
        """Main loop: read frames, update last_frame, distribute to active jobs"""
        while not self.is_stopped:
            try:
                if not self.stream_online:
                    self.init_cam()

                while self.stream_online and not self.is_stopped:
                    try:
                        frame = self.stream.read()
                    except Exception as e:
                        self.logger.logError(f"{self.camera_name} stream read error: {e}")
                        frame = None

                    if frame is None:
                        self.logger.logInfo(f"{self.camera_name} lost connection, retrying...")
                        self.stream.stop()
                        self.stream_online = False
                        break

                    # Update last frame
                    with self.frame_lock:
                        self.last_frame = frame.copy()

                    # Distribute frame to active recording queues
                    for job in list(self.active_recordings):
                        if time.time() < job["end_time"]:
                            job["queue"].append(frame.copy())

                    # pace producer at camera FPS
                    time.sleep(1.0 / self.frame_rate)

                time.sleep(self.retry_delay)

            except Exception as e:
                self.logger.logError(f"Exception {self.camera_name} run_main: {str(e)}")
                self.stream_online = False
                time.sleep(self.retry_delay)

    # ---------------------------------------------------------
    def get_screenshot(self, output_file):
        try:
            if not output_file.endswith(".jpg"):
                output_file += ".jpg"
            snapshot_file_path = os.path.join(self.file_path_dir, output_file)

            with self.frame_lock:
                if self.last_frame is not None:
                    cv2.imwrite(snapshot_file_path, self.last_frame.copy())
                    return snapshot_file_path
                else:
                    self.logger.logInfo(f"{self.camera_name} no frame for screenshot")
                    return None
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} get_screenshot: {str(e)}")
            return None

    # ---------------------------------------------------------
    def start_recording(self, output_file, screenshot_mode=None, duration=None):
        if not self.stream_online:
            self.logger.logInfo(f"{self.camera_name} Camera offline in start_recording")
            return False

        # allow per-call override
        duration = duration if duration else self.record_timeout
        self.logger.logInfo(f"{self.camera_name} duration: {duration}")

        img_file_name = output_file + ".jpg"
        video_file_name = output_file + ".mp4"
        record_file_path = os.path.join(self.file_path_dir, video_file_name)
        image_file_path = os.path.join(self.file_path_dir, img_file_name)
        os.makedirs(os.path.dirname(record_file_path), exist_ok=True)

        if screenshot_mode in ("start", "both"):
            self.get_screenshot(img_file_name)

        output_params = {
            "-vcodec": "libx264",
            "-crf": "28",
            "-preset": "fast",
            "-pix_fmt": "yuv420p",
            "-r": str(self.frame_rate)
        }

        try:
            writer = WriteGear(output=record_file_path, compression_mode=True, logging=False, **output_params)
        except Exception as e:
            self.logger.logError(f"{self.camera_name} WriteGear init failed: {str(e)}")
            return False

        # create per-recording queue (fps * duration)
        frame_queue = deque(maxlen=self.frame_rate * duration)
        job = {
            "queue": frame_queue,
            "writer": writer,
            "end_time": time.time() + duration,
            "image_file": image_file_path,
            "video_file": record_file_path,
            "screenshot_mode": screenshot_mode,
            "finalized": False
        }
        self.active_recordings.append(job)

        # spawn recording thread
        threading.Thread(target=self.record_loop, args=(job,), daemon=True).start()
        return True

    # ---------------------------------------------------------
    def record_loop(self, job):
        writer = job["writer"]
        queue = job["queue"]
        fps_interval = 1.0 / self.frame_rate
        next_frame_time = time.time()

        try:
            while time.time() < job["end_time"]:
                if queue:
                    frame = queue.popleft()
                    now = time.time()

                    # wait until it's time for the next frame
                    if now < next_frame_time:
                        time.sleep(next_frame_time - now)

                    writer.write(frame)
                    next_frame_time += fps_interval
                else:
                    # no frame available, wait a little
                    time.sleep(0.005)

            # take screenshot at end if required
            if job["screenshot_mode"] in ("end", "both") and job["image_file"]:
                self.get_screenshot(job["image_file"])

        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} record_loop: {str(e)}")
        finally:
            video_file = self._finalize_recording(job)
            # if video_file:
            #     self.update_status(video_file)

    # ---------------------------------------------------------
    def update_status(self, file_path):
        try:
            file_name = os.path.basename(file_path)
            self.handler.update_media_status(file_name)
        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} update_status: {str(e)}")

    def _finalize_recording(self, job):
        try:
            video_file = job.get("video_file", None)

            if job.get("finalized", False):
                return None
            job["finalized"] = True

            if job in self.active_recordings:
                self.active_recordings.remove(job)

            if job.get("writer"):
                try:
                    job["writer"].close()
                except Exception as e:
                    self.logger.logError(f"{self.camera_name} writer close failed: {str(e)}")

            if video_file:
                self.logger.logInfo(f"{self.camera_name} recording finalized: {video_file}")
                return video_file

        except Exception as e:
            self.logger.logError(f"Exception {self.camera_name} finalize_recording: {str(e)}")
            return None

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
