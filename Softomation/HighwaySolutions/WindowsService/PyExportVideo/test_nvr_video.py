import subprocess

# --- NVR login info ---
nvr_ip = "192.168.11.208"
username = "admin"
password = "mcube%40123"
channel = 17

# --- Time range (UTC format expected by NVR) ---
starttime_str = '2025_03_27_18_00_07'
endtime_str = '2025_03_27_18_00_15'  # Optional

# --- RTSP URL ---
rtsp_url = (
    f"rtsp://{username}:{password}@{nvr_ip}:554/cam/playback"
    f"?channel={channel}"
    f"&starttime={starttime_str}"
    f"&endtime={endtime_str}"
)

# --- Output files ---
output_video = f"{starttime_str}.mp4"
output_image = f"{starttime_str}_snapshot.jpg"

# --- FFmpeg command to save 8 seconds of video ---
video_cmd = [
    "ffmpeg",
    "-rtsp_transport", "tcp",  # more reliable
    "-i", rtsp_url,
    "-t", "8",
    "-c:v", "libx264",
    "-preset", "veryfast",
    "-crf", "23",
    "-s", "640x360",
    "-y",
    output_video
]

# --- FFmpeg command to capture a snapshot at 5th second ---
snapshot_cmd = [
    "ffmpeg",
    "-rtsp_transport", "tcp",
    "-i", rtsp_url,
    "-ss", "7",
    "-frames:v", "1",
    "-q:v", "2",
    "-s", "640x360",
    "-y",
    output_image
]

print(f"📡 RTSP stream (UTC): {starttime_str}")

try:
    result = subprocess.run(video_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    if result.returncode != 0:
        print("❌ FFmpeg video capture failed!")
        print(result.stderr)
    else:
        print(f"✅ Video saved as {output_video}")

        snapshot = subprocess.run(snapshot_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        if snapshot.returncode != 0:
            print("❌ Snapshot failed!")
            print(snapshot.stderr)
        else:
            print(f"📸 Snapshot saved as {output_image}")

except FileNotFoundError:
    print("❌ ffmpeg not found. Install it via apt or download manually.")
except subprocess.TimeoutExpired:
    print("⏱️ FFmpeg command timed out.")
except Exception as e:
    print("⚠️ Unexpected error:", str(e))
