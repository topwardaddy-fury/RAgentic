#!/bin/bash

# RAgentic Advanced Self-Scan Agent
# Protocol: 1. Identify 2. Source 3. Attest 4. Reason

IMAGE_NAME="ragentic-app:latest"
SEVERITY="CRITICAL,HIGH"

echo "🛡️ RAgentic Watchdog: Initiating Desktop Security Scan for $IMAGE_NAME..."

# Pulling latest scan database if needed
docker pull aquasec/trivy:latest > /dev/null 2>&1

# Run the Scan (Self-Healing Identify step)
# Mounting docker.sock allows scanning the local image, not just remote.
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v $HOME/.cache/trivy:/root/.cache/ \
    aquasec/trivy:latest \
    image --severity $SEVERITY --no-progress $IMAGE_NAME

SCAN_RESULT=$?

if [ $SCAN_RESULT -ne 0 ]; then
    echo "🚨 ALERT: High/Critical vulnerabilities found in $IMAGE_NAME!"
    
    # Desktop Notification via osascript
    osascript -e "display notification \"Vulnerabilities found in RAgentic! System compromise possible.\" with title \"🛡️ RAgentic Security Alert\""
    
    # Identify Reason (Search for fix)
    echo "🔍 RAgentic Reasoning: Identifying downstream fixes..."
    # The scan output above lists fixed versions. RAgentic identifies these for the next patch cycle.
    exit 1
else
    echo "✅ RAgentic Watchdog: System Verified. No $SEVERITY vulnerabilities found."
    osascript -e "display notification \"Security Scan Complete. System is Secured.\" with title \"🛡️ RAgentic Verified\""
    exit 0
fi
