#!/bin/bash
# Use completely different ports to avoid conflicts
PORT=5100          # Hosting port
FIRESTORE_PORT=8100 # Firestore port
UI_PORT=4100       # UI port

# Configure firebase.json with explicit IPv4 hosts
cat <<CONFIG > firebase.json
{
  "hosting": {
    "public": "public",
    "rewrites": [{"source": "**", "destination": "/index.html"}]
  },
  "emulators": {
    "ui": {
      "enabled": true,
      "host": "127.0.0.1",
      "port": $UI_PORT
    },
    "firestore": {
      "host": "127.0.0.1",
      "port": $FIRESTORE_PORT
    },
    "hosting": {
      "host": "127.0.0.1",
      "port": $PORT
    }
  }
}
CONFIG

# Clear any existing emulator locks
rm -f .firebase/emulators-ui-*.json

echo "🚀 Starting Prototyper on fresh ports (IPv4)"
echo "• UI: http://127.0.0.1:$UI_PORT"
echo "• Hosting: http://127.0.0.1:$PORT"
firebase emulators:start --project open-lovable-f47cb
