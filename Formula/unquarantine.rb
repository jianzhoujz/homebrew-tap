class Unquarantine < Formula
  desc "CLI tool to remove quarantine attributes from macOS applications"
  homepage "https://github.com/jianzhoujz/unquarantine"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jianzhoujz/unquarantine/releases/download/v1.3.0/unquarantine-1.3.0-darwin-arm64.tar.gz"
      sha256 "5ff7b8a1cb73dace9629323ce98a62d8e6e8b0467bcdcbd7655b7b0dabfd2034"
    end
    on_intel do
      url "https://github.com/jianzhoujz/unquarantine/releases/download/v1.3.0/unquarantine-1.3.0-darwin-amd64.tar.gz"
      sha256 "e9484ef2469d38a18f6f079d95e7ac9936d4e0f33b400a31eacf8687faf883ee"
    end
  end

  def install
    binary_name = if Hardware::CPU.arm?
      "unquarantine-darwin-arm64"
    else
      "unquarantine-darwin-amd64"
    end
    bin.install binary_name => "unquarantine"
  end

  test do
    assert_match "unquarantine v#{version}", shell_output("#{bin}/unquarantine 2>&1", 1)
  end
end
