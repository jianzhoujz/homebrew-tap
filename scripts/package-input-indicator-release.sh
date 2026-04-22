#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-1.0.0}"
PRODUCT_REPO="${2:-../input-indicator}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TAP_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PRODUCT_REPO="$(cd "$PRODUCT_REPO" && pwd)"
DIST_DIR="$PRODUCT_REPO/dist"

cd "$PRODUCT_REPO"

APP_VERSION="$VERSION" APP_BUILD="$VERSION" ./build.sh doubao >/dev/null
APP_VERSION="$VERSION" APP_BUILD="$VERSION" ./build.sh wetype >/dev/null

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

ditto -c -k --keepParent \
  "$PRODUCT_REPO/build/DoubaoInputIndicator.app" \
  "$DIST_DIR/DoubaoInputIndicator-$VERSION.zip"

ditto -c -k --keepParent \
  "$PRODUCT_REPO/build/WeTypeInputIndicator.app" \
  "$DIST_DIR/WeTypeInputIndicator-$VERSION.zip"

DOUBAO_SHA="$(shasum -a 256 "$DIST_DIR/DoubaoInputIndicator-$VERSION.zip" | awk '{print $1}')"
WETYPE_SHA="$(shasum -a 256 "$DIST_DIR/WeTypeInputIndicator-$VERSION.zip" | awk '{print $1}')"

export TAP_ROOT VERSION DOUBAO_SHA WETYPE_SHA

ruby <<'RUBY'
replacements = {
  "Casks/doubao-input-indicator.rb" => ENV.fetch("DOUBAO_SHA"),
  "Casks/wetype-input-indicator.rb" => ENV.fetch("WETYPE_SHA"),
}

replacements.each do |relative_path, sha|
  path = File.join(ENV.fetch("TAP_ROOT"), relative_path)
  contents = File.read(path)
  contents = contents.sub(/version "[^"]+"/, %(version "#{ENV.fetch("VERSION")}"))
  contents = contents.sub(/sha256 "[0-9a-f]{64}"/, %(sha256 "#{sha}"))
  File.write(path, contents)
end
RUBY

printf '%s  %s\n' "$DOUBAO_SHA" "$DIST_DIR/DoubaoInputIndicator-$VERSION.zip"
printf '%s  %s\n' "$WETYPE_SHA" "$DIST_DIR/WeTypeInputIndicator-$VERSION.zip"
printf '\nUpdated casks in %s\n' "$TAP_ROOT"

cat <<EOF

Upload with:
gh release create v$VERSION \\
  "$DIST_DIR/DoubaoInputIndicator-$VERSION.zip" \\
  "$DIST_DIR/WeTypeInputIndicator-$VERSION.zip" \\
  --repo jianzhoujz/input-indicator \\
  --title v$VERSION
EOF
