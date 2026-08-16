#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_DEST="${REPO_DIR}/skills"
UPSTREAM_URL="https://github.com/mattpocock/skills.git"
TEMP_DIR="$(mktemp -d)"

echo "==> Cloning latest upstream skills from ${UPSTREAM_URL}..."
git clone --depth 1 "${UPSTREAM_URL}" "${TEMP_DIR}/upstream"

echo "==> Syncing skills into Antigravity structure..."
mkdir -p "${SKILLS_DEST}"

# Find all directories containing a SKILL.md (excluding .git, deprecated, etc.)
find "${TEMP_DIR}/upstream/skills" -type f -name "SKILL.md" | while read -r skill_file; do
  skill_dir="$(dirname "${skill_file}")"
  skill_name="$(basename "${skill_dir}")"
  
  # Skip deprecated if needed, or include everything useful
  if [[ "${skill_dir}" == *"/deprecated/"* ]]; then
    echo "  [skip] Deprecated skill: ${skill_name}"
    continue
  fi

  echo "  [sync] Syncing skill: ${skill_name}"
  target_dir="${SKILLS_DEST}/${skill_name}"
  mkdir -p "${target_dir}"
  
  # Copy the entire skill folder content (SKILL.md, scripts, resources, etc.)
  rsync -av --delete "${skill_dir}/" "${target_dir}/"
done

# Clean up temp clone
rm -rf "${TEMP_DIR}"

echo "==> Sync complete! Running validation..."
"${REPO_DIR}/scripts/validate.sh"
