import subprocess

# --- Your NVR login info ---
nvr_ip = "192.168.11.208"
username = "admin"
password = "mcube%40123"
channel = 30
#rtsp://admin:mcube%40123@192.168.11.208:554/cam/playback?channel=30&starttime=2025_03_27_18_00_02&endtime=2025_03_27_19_00_02

#2025-03-21 00:00:21.3130
#2025-03-21 12:49:01.4490
starttime_str = '2025_03_27_18_00_02'
endtime_str = '2025_03_27_18_00_10'
rtsp_url = (
    f"rtsp://{username}:{password}@{nvr_ip}:554/cam/playback"
    f"?channel={channel}"
    f"&starttime={starttime_str}"
    f"&endtime={endtime_str}"
)

# --- Output file ---
output_file = f"{starttime_str}.jpg"

# --- FFmpeg command ---
cmd = [
    "ffmpeg",
    "-i", rtsp_url,
    "-frames:v", "1",
    "-q:v", "2",
    "-s", "1280x720", 
    output_file
]

print(f"📡 RTSP stream (UTC): {starttime_str}")
try:
    result=subprocess.run(cmd)
    if result.returncode != 0:
            print("❌ FFmpeg failed!")
    else:
        print(f"✅ Snapshot saved as {output_file}")

except FileNotFoundError:
    print("❌ ffmpeg not found. Install it via apt or download manually.")
except subprocess.TimeoutExpired:
    print("⏱️ FFmpeg command timed out.")
except Exception as e:
    print("⚠️ Unexpected error:", str(e))

print(f"✅ Snapshot saved as {output_file}")
