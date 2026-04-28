class Unquarantine < Formula
  desc "CLI tool to remove quarantine attributes from macOS applications"
  homepage "https://github.com/jianzhoujz/unquarantine"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jianzhoujz/unquarantine/releases/download/v1.0.0/unquarantine-1.0.0-darwin-arm64.tar.gz"
      sha256 "4248984a3c9d09669859eb44a62a979edbe69b068537178a31b235626007c3b9"
    end
    on_intel do
      url "https://github.com/jianzhoujz/unquarantine/releases/download/v1.0.0/unquarantine-1.0.0-darwin-amd64.tar.gz"
      sha256 "439156456c6fcc49aacd6836205c32db282bba0f441d4633ebceddddaeb36722"
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
