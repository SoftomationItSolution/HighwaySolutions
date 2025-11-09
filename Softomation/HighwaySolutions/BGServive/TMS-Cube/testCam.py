import time

from threads.ip_cam_thread import IpCameraHandler
from web_socket.wsSocketClient import wsSocketClient


# Dummy handler for updating equipment list (replace with your real handler later)
class DummyHandler:
    def update_equipment_list(self, equipment_id, field, value):
        print(f"[Handler] Equipment {equipment_id}: {field} -> {value}")

    def get_on_line_status(self, equipment_type_id):
        return 1   # always online for testing

# if __name__ == "__main__":
#     handler = DummyHandler()

#     # Camera config
#     equipment = {
#         "EquipmentId": 1,
#         "EquipmentTypeId": 1,
#         "UrlAddress": "rtsp://onvif_user:Softo%402005@192.168.29.241:554/cam/realmonitor?channel=1&subtype=0&unicast=true&proto=Onvif"
#     }

#     # Create camera handler (force FPS=15)
#     cam = IpCameraHandler(
#         handler=handler,
#         default_directory=r"C:\ProjectConfig\TMSv1",     # save videos & screenshots in current folder
#         camera_name="TestCam",
#         log_file_name="testcam.log",
#         equipment=equipment,
#         retry_delay=2,
#         fps=15,
#         force_fps=True
#     )

#     # Start camera (runs 24x7 in background thread)
#     cam.start()
#     print("Camera thread started. Waiting for connection...")

#     # Give some time to connect
#     time.sleep(5)

#     # Test screenshot
#     print("Taking screenshot...")
#     img_path = cam.get_screenshot()
#     print("Screenshot saved:", img_path)

#     # Test 5s recording with screenshot at start
#     print("Recording 5s with screenshot at start...")
#     cam.start_recording("event_test1", duration=10, screenshot_mode="start")

#     # Wait longer than duration to allow recording thread to finish
#     time.sleep(7)

#     # Test 5s recording with screenshot at end
#     print("Recording 5s with screenshot at end...")
#     cam.start_recording("event_test2", duration=10, screenshot_mode="end")

#     time.sleep(7)

#     # Test recording with screenshot at both start & end
#     print("Recording 5s with screenshot at both start and end...")
#     cam.start_recording("event_test3", duration=10, screenshot_mode="both")

#     time.sleep(7)

#     # Stop camera thread cleanly
#     cam.stop()
#     print("Camera stopped.")



#---- Usage Example ----
# if __name__ == "__main__":
    
#     url = "ws://localhost:5001/ws"   # your Node.js server
#     client = wsSocketClient(r"C:\ProjectConfig\TMSv1",url)
#     client.start()

#     time.sleep(10)
#     client.send({"msg": "test"})
#     client.stop()          # clean shutdown
#     client.join()          # wait for thread to exit
