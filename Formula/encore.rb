class Encore < Formula
  desc "Local proxy for AI APIs with automatic retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.6"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.6/encore-0.3.6-darwin-arm64.tar.gz"
    sha256 "7d2366e399f7d58b64fc5f156e2c589f26a0d603f66257fafbff05af21c2a13d"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.6/encore-0.3.6-darwin-amd64.tar.gz"
    sha256 "414ce368899ea262cd6e55b49ca1d642c7aa3133b53c9c9019b7be039e02edbf"
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
