class Encore < Formula
  desc "Local proxy for free AI APIs with automatic rate-limit retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-arm64.tar.gz"
      sha256 "ad392d60b7c50a121ebd5c3f30cf16029cb1038b293546863d37c4d3ecd0f6d3"
    end
    on_intel do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-amd64.tar.gz"
      sha256 "709cc2b0373e49f15356c4eee5e70f49e7bb1628f9fa407e8b48a1d5c6417f5b"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "encore-darwin-arm64" => "encore"
    else
      bin.install "encore-darwin-amd64" => "encore"
    end
  end

  test do
    assert_match "encore v#{version}", shell_output("#{bin}/encore version")
  end
end
