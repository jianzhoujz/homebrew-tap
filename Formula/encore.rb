class Encore < Formula
  desc "Local proxy for AI APIs with automatic retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.3"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.3/encore-0.3.3-darwin-arm64.tar.gz"
    sha256 "774c3e6e380d14b775f2afcebbe0b2ad76f7f64fd1eb2ba7809b89c8ee428bb7"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.3/encore-0.3.3-darwin-amd64.tar.gz"
    sha256 "6372bfc88511d0ab8f68175bddcb2af306456da1521b547c1a281407c04ae854"
  end

  def install
    binary_name = if Hardware::CPU.arm?
      "encore-darwin-arm64"
    else
      "encore-darwin-amd64"
    end
    bin.install binary_name => "encore"
  end

  test do
    assert_match "encore v#{version}", shell_output("#{bin}/encore version")
  end
end
