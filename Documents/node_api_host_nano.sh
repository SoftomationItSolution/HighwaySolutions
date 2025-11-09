#!/bin/bash
set -e  # Exit on first error

echo "=============================="
echo "[INFO] Starting setup script..."
echo "=============================="

# ---- Cleanup Step: Kill root PM2 and fix permissions ----
echo "[INFO] Checking for root-owned PM2..."
ROOT_PM2_PID=$(ps -ef | grep "PM2 v" | grep root | awk '{print $2}' || true)

if [[ -n "$ROOT_PM2_PID" ]]; then
  echo "[WARN] Found root PM2 running (PID: $ROOT_PM2_PID). Killing..."
  sudo kill -9 $ROOT_PM2_PID || true
else
  echo "[OK] No root-owned PM2 daemon found."
fi

echo "[INFO] Fixing ownership of ~/.pm2..."
sudo chown -R $(whoami):$(whoami) $HOME/.pm2 || true

# ---- Step 1: Ensure jq is installed ----
if ! command -v jq &> /dev/null; then
    echo "[INFO] Installing jq..."
    sudo apt update && sudo apt install -y jq
else
    echo "[OK] jq is already installed."
fi

# ---- Step 2: Detect system IP ----
IP=$(hostname -I | awk '{print $1}')
echo "[INFO] Detected IP: $IP"

# ---- Step 3: Update ServerUrl in JSON ----
CONFIG_FILE="/opt/soft/PyLaneV3App/assets/GeneralConfiguration.json"
echo "[INFO] Updating ServerUrl in $CONFIG_FILE"

if [[ -f "$CONFIG_FILE" ]]; then
  jq --arg ip "$IP" --indent 4 '.ServerUrl = "ws://\($ip):5001/frame/"' "$CONFIG_FILE" > tmp.json \
    && mv tmp.json "$CONFIG_FILE"
  echo "[OK] ServerUrl updated to ws://$IP:5001/frame/"
else
  echo "[ERROR] Configuration file not found at $CONFIG_FILE"
  exit 1
fi

# ---- Step 4: Install NVM if not present ----
export NVM_DIR="$HOME/.nvm"
if [[ ! -s "$NVM_DIR/nvm.sh" ]]; then
  echo "[INFO] Installing NVM..."
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# Load NVM
echo "[INFO] Loading NVM..."
source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# ---- Step 5: Install and use Node.js v16 ----
echo "[INFO] Installing Node.js v16..."
nvm install 16
nvm alias default 16
nvm use 16

# ---- Step 6: Show Node and NPM version ----
echo "[INFO] Node version: $(node -v)"
echo "[INFO] NPM version: $(npm -v)"

# ---- Step 7: Install PM2 globally ----
echo "[INFO] Installing PM2..."
npm install -g pm2
echo "[OK] PM2 version: $(pm2 -v)"

# ---- Step 8: Navigate to API folder ----
API_DIR="/opt/soft/LiveViewApi"
echo "[INFO] Navigating to API directory: $API_DIR"
cd "$API_DIR" || { echo "[ERROR] Failed to enter API directory"; exit 1; }

# ---- Step 9: Install Node.js dependencies ----
echo "[INFO] Running npm install..."
npm install

# ---- Step 10: Start API with PM2 ----
echo "[INFO] Starting API with PM2 (auto-restart enabled)"
pm2 delete liveview-api >/dev/null 2>&1 || true
pm2 start live.js --name "liveview-api" --watch --restart-delay=5000 -f

# ---- Step 11: Save PM2 process list ----
pm2 save

# ---- Step 12: Enable PM2 startup service ----
echo "[INFO] Setting up PM2 startup service..."
sudo env PATH=$PATH:$(dirname "$(which pm2)") \
  $(which pm2) startup systemd -u $(whoami) --hp $HOME

echo "=============================="
echo "[OK] Setup completed!"
echo "[INFO] Check status with: pm2 status"
echo "[INFO] Logs with: pm2 logs liveview-api"
echo "=============================="
