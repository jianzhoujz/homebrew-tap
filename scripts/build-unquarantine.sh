#!/usr/bin/env bash
# Build and release script for unquarantine
# Usage: ./build-unquarantine.sh <version> [source_dir]

set -euo pipefail

# Config
VERSION="${1:-}"
SOURCE_DIR="${2:-../unquarantine}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TAP_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
FORMULA_PATH="${TAP_ROOT}/Formula/unquarantine.rb"
DIST_DIR="${TAP_ROOT}/dist/unquarantine"
GITHUB_REPO="jianzhoujz/unquarantine"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
GRAY='\033[90m'
NC='\033[0m'

# Validate
if [[ -z "${VERSION}" ]]; then
    echo -e "${RED}Error: missing version${NC}"
    echo "Usage: $0 <version> [source_dir]"
    exit 1
fi

VERSION="${VERSION#v}"
SOURCE_DIR="$(cd "${SOURCE_DIR}" 2>/dev/null || exit 1; pwd)"

if [[ ! -f "${SOURCE_DIR}/main.go" ]]; then
    echo -e "${RED}Error: main.go not found in ${SOURCE_DIR}${NC}"
    exit 1
fi

echo -e "${CYAN}Building unquarantine v${VERSION}${NC}"
echo -e "${GRAY}Source: ${SOURCE_DIR}${NC}"
echo -e "${GRAY}Output: ${DIST_DIR}${NC}"

rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}"

# Build
ARM64_SHA=""
AMD64_SHA=""

build_platform() {
    local GOOS="$1"
    local GOARCH="$2"
    local OUTPUT="unquarantine-${VERSION}-${GOOS}-${GOARCH}"
    local BINARY="${DIST_DIR}/${OUTPUT}"
    local ARCHIVE="${OUTPUT}.tar.gz"
    
    echo -e "${GRAY}Building ${GOOS}/${GOARCH}...${NC}"
    
    cd "${SOURCE_DIR}"
    CGO_ENABLED=0 GOOS="${GOOS}" GOARCH="${GOARCH}" go build -ldflags="-s -w" -o "${BINARY}" .
    
    cd "${DIST_DIR}"
    tar -czf "${ARCHIVE}" "${OUTPUT}"
    
    local SHA=$(shasum -a 256 "${ARCHIVE}" | awk '{print $1}')
    rm "${BINARY}"
    
    echo -e "${GREEN}OK${NC}   ${GOARCH}: ${SHA:0:16}... ${ARCHIVE}"
    
    if [[ "${GOARCH}" == "arm64" ]]; then
        ARM64_SHA="${SHA}"
    else
        AMD64_SHA="${SHA}"
    fi
}

build_platform darwin arm64
build_platform darwin amd64

# Update Formula
echo -e "${GRAY}Updating Formula...${NC}"

ruby - "${VERSION}" "${ARM64_SHA}" "${AMD64_SHA}" "${FORMULA_PATH}" <<'RUBY'
version, arm64_sha, amd64_sha, path = ARGV

content = File.read(path)
content = content.sub(/version "[^"]+"/, "version \"#{version}\"")

content = content.sub(
  /on_arm do\s+url "[^"]+"\s+sha256 "[^"]+"/,
  "on_arm do\n      url \"https://github.com/jianzhoujz/unquarantine/releases/download/v#{version}/unquarantine-#{version}-darwin-arm64.tar.gz\"\n      sha256 \"#{arm64_sha}\""
)

content = content.sub(
  /on_intel do\s+url "[^"]+"\s+sha256 "[^"]+"/,
  "on_intel do\n      url \"https://github.com/jianzhoujz/unquarantine/releases/download/v#{version}/unquarantine-#{version}-darwin-amd64.tar.gz\"\n      sha256 \"#{amd64_sha}\""
)

File.write(path, content)
RUBY

echo -e "${GREEN}OK${NC}   Formula updated"

# Summary
echo
echo -e "${CYAN}Results:${NC}"
ls -lh "${DIST_DIR}"/*.tar.gz | awk '{print "  " $NF ": " $5}'
echo
echo -e "${CYAN}SHA256:${NC}"
echo "  arm64: ${ARM64_SHA}"
echo "  amd64: ${AMD64_SHA}"
echo

# Next steps
cat <<EOF
Next steps:

1. Commit Formula:
   cd "${TAP_ROOT}"
   git add Formula/unquarantine.rb
   git commit -m "unquarantine: update to v${VERSION}"

2. Create tag in source repo:
   cd "${SOURCE_DIR}"
   git tag "v${VERSION}"
   git push origin "v${VERSION}"

3. Create GitHub Release:
   gh release create "v${VERSION}" \
     "${DIST_DIR}/unquarantine-${VERSION}-darwin-arm64.tar.gz" \
     "${DIST_DIR}/unquarantine-${VERSION}-darwin-amd64.tar.gz" \
     --repo "${GITHUB_REPO}" \
     --title "v${VERSION}" \
     --notes "brew tap jianzhoujz/tap && brew install unquarantine"

4. Push tap:
   cd "${TAP_ROOT}"
   git push origin main
EOF