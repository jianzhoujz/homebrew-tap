class Encore < Formula
  desc "Encore CLI tool"
  homepage "https://github.com/jianzhoujz/encore"
  version "1.0.0"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v1.0.0/encore-1.0.0-darwin-arm64.tar.gz"
    sha256 "d41d8cd98f00b204e9800998ecf8427e"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v1.0.0/encore-1.0.0-darwin-amd64.tar.gz"
    sha256 "d41d8cd98f00b204e9800998ecf8427e"
  end

  def install
    binary_name = if Hardware::CPU.arm?
      "encore-#{version}-darwin-arm64"
    else
      "encore-#{version}-darwin-amd64"
    end
    bin.install binary_name => "encore"
  end

  test do
    assert_match "encore v#{version}", shell_output("#{bin}/encore 2>&1", 1)
  end
end
