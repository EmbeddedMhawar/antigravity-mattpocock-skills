#!/usr/bin/env bash
set -e

PLUGIN_NAME="mattpocock-skills"
PLUGIN_DIR="${HOME}/.gemini/config/plugins/${PLUGIN_NAME}"
REPO_URL="https://github.com/abderrahmane-mhawar/antigravity-mattpocock-skills.git"

echo "============================================================"
echo "  Google Antigravity: Matt Pocock Skills Plugin Installer"
echo "============================================================"

if [ -d "$PLUGIN_DIR" ]; then
  echo "==> Existing installation detected at ${PLUGIN_DIR}."
  echo "==> Pulling latest updates..."
  cd "$PLUGIN_DIR"
  git pull --quiet origin main || true
  echo "✅ Successfully updated to the latest version!"
else
  echo "==> Installing plugin to ${PLUGIN_DIR}..."
  mkdir -p "$(dirname "$PLUGIN_DIR")"
  git clone --depth 1 "$REPO_URL" "$PLUGIN_DIR"
  echo "✅ Installation complete!"
fi

echo ""
echo "🎉 35+ Matt Pocock engineering workflows are now active in Antigravity!"
echo "   Try prompting Antigravity with:"
echo "   - '/setup-matt-pocock-skills' (Initialize project context & tracker)"
echo "   - '/grill-me' (Stress-test your architectural design)"
echo "   - '/tdd' (Enforce test-driven development)"
echo "   - 'Diagnose this bug' (Hypothesis-driven bug diagnosis)"
echo "============================================================"
