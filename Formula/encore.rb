class Encore < Formula
  desc "Local proxy for AI APIs with automatic retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.4"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.4/encore-0.3.4-darwin-arm64.tar.gz"
    sha256 "9f5d226e979ab2d6ce71a6f557a7c258ce00a15941f0ab71bcd434e2e846c980"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.4/encore-0.3.4-darwin-amd64.tar.gz"
    sha256 "b915eeb91fe4ca5db278e06ffd4f173813722bd22303ded82fa72311eca9484a"
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
