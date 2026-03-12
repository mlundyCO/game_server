#!/data/data/com.termux/files/usr/bin/bash

SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
cd "$SCRIPT_DIR"
echo "Running from: $(pwd)"

PORT="${1:-8000}"

HOST_IP=$(
  ifconfig 2>/dev/null |
  awk '/inet / {print $2}' |
  grep -v '^127\.' |
  grep -v '^192\.' |
  grep -v '^100\.' |
  head -n1
)

if [ -z "$HOST_IP" ]; then
    echo "Could not determine hotspot IP from ifconfig output."
    echo "Make sure the hotspot is turned on, then run ifconfig and inspect the hotspot-facing interface."
    exit 1
fi

URL="http://${HOST_IP}:${PORT}/"
MSG="Join URL: $URL"

# Create a border of '=' the same width as the message
BORDER=$(printf '=%.0s' $(seq 1 ${#MSG}))

echo
echo "Game server starting"
echo
echo "$BORDER"
echo "$MSG"
echo "$BORDER"
echo
qrencode -t ansiutf8 "$URL"
echo

exec python -m http.server "$PORT"
