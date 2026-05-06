class Encore < Formula
  desc "Local proxy for AI APIs with automatic retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.8"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.8/encore-0.3.8-darwin-arm64.tar.gz"
    sha256 "94c27e087fba37965946ff1c38318ea7d014a122a417990b12fdb44f628898fe"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.8/encore-0.3.8-darwin-amd64.tar.gz"
    sha256 "5489ef1b4652af36f9a56caa83f80225f9459769ce9d76b4ca084f39d4f6667a"
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
