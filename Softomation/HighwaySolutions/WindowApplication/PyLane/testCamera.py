import cv2
import time

def initialize_video_capture(rtsp_url):
    video_capture = cv2.VideoCapture(rtsp_url)  
    if not video_capture.isOpened():
        print("Error opening camera")
        return None
    return video_capture

def record_video(video_capture, output_file="output.avi", duration=10):
    fourcc = cv2.VideoWriter_fourcc(*'XVID')  
    out = cv2.VideoWriter(output_file, fourcc, 20.0, (640, 480)) 
    start_time = time.time()
    while True:
        ret, frame = video_capture.read()
        if ret:
            out.write(frame)
            cv2.imshow('Recording', frame)  

            if cv2.waitKey(1) == ord('q') or time.time() - start_time >= duration:
                break
        else:
            break

    video_capture.release()
    out.release()
    cv2.destroyAllWindows()

def take_snapshot(video_capture, output_file="snapshot.jpg", snapshot_taken=False):
    if not snapshot_taken:
        ret, frame = video_capture.read()
        if ret:
            timestamp = time.strftime("%Y%m%d-%H%M%S")
            output_file = f"snapshot_{timestamp}.jpg" 
            cv2.imwrite(output_file, frame)
            return True  
        else:
            print("Error capturing frame")
    return False  

if __name__ == "__main__":
    video_capture = initialize_video_capture()
    if video_capture:
        record_video(video_capture)  
        snapshot_taken = take_snapshot(video_capture) 
        video_capture.release() 
