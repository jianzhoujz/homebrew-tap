class Encore < Formula
  desc "Local proxy for free AI APIs with automatic rate-limit retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-arm64.tar.gz"
      sha256 "a90f7fd2b0233701233dfa160b2d59e228c77721f902e977efa13eaa16e6e228"
    end
    on_intel do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-amd64.tar.gz"
      sha256 "0fcb818999d5f78c4a3d22a3dcb0057ff0590203c280160df47408f073872968"
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
