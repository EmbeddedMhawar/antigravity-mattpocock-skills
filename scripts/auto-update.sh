#!/usr/bin/env bash
# Antigravity Lifecycle Hook: PreInvocation Background Auto-Updater
# Consumes stdin JSON from Antigravity
cat > /dev/null

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOCK_FILE="${HOME}/.gemini/.mattpocock_plugin_last_sync"
UPDATE_INTERVAL_HOURS=24

# Create .gemini dir if it doesn't exist
mkdir -p "${HOME}/.gemini"

# Check if 24 hours have passed since the last check
if [ -f "$LOCK_FILE" ]; then
  LAST_UPDATE=$(stat -c %Y "$LOCK_FILE" 2>/dev/null || stat -f %m "$LOCK_FILE" 2>/dev/null || echo 0)
  CURRENT_TIME=$(date +%s)
  HOURS_DIFF=$(( (CURRENT_TIME - LAST_UPDATE) / 3600 ))

  if [ "$HOURS_DIFF" -lt "$UPDATE_INTERVAL_HOURS" ]; then
    # Fast path: exit immediately with valid JSON (< 5ms)
    echo '{"injectSteps": []}'
    exit 0
  fi
fi

# Update timestamp lock
touch "$LOCK_FILE"

# Run git pull silently in background if inside a git repository
if [ -d "$PLUGIN_DIR/.git" ]; then
  (cd "$PLUGIN_DIR" && git pull --quiet origin main >/dev/null 2>&1) &
fi

# Return valid response according to Antigravity hook contract
echo '{"injectSteps": []}'
exit 0
