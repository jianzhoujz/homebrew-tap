#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:-1.0.0}"
PRODUCT_REPO="${2:-../input-indicator}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TAP_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
PRODUCT_REPO="$(cd "${PRODUCT_REPO}" && pwd)"
DIST_DIR="${PRODUCT_REPO}/dist"

cd "${PRODUCT_REPO}"

rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}"

APP_VERSION="${VERSION}" APP_BUILD="${VERSION}" ./package-dmg.sh doubao >/dev/null
APP_VERSION="${VERSION}" APP_BUILD="${VERSION}" ./package-dmg.sh wetype >/dev/null

DOUBAO_DMG="${DIST_DIR}/DoubaoInputIndicator-${VERSION}.dmg"
WETYPE_DMG="${DIST_DIR}/WeTypeInputIndicator-${VERSION}.dmg"
DOUBAO_SHA="$(shasum -a 256 "${DOUBAO_DMG}" | awk '{print $1}')"
WETYPE_SHA="$(shasum -a 256 "${WETYPE_DMG}" | awk '{print $1}')"

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
  contents = contents.sub(/InputIndicator-\#\{version\}\.zip/, 'InputIndicator-#{version}.dmg')
  File.write(path, contents)
end
RUBY

printf '%s  %s\n' "${DOUBAO_SHA}" "${DOUBAO_DMG}"
printf '%s  %s\n' "${WETYPE_SHA}" "${WETYPE_DMG}"
printf '\nUpdated casks in %s\n' "${TAP_ROOT}"

cat <<EOF

Upload with:
gh release create v${VERSION} \\
  "${DOUBAO_DMG}" \\
  "${WETYPE_DMG}" \\
  --repo jianzhoujz/input-indicator \\
  --title v${VERSION}
EOF
