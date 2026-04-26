class Encore < Formula
  desc "Local proxy for free AI APIs with automatic rate-limit retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-arm64.tar.gz"
      sha256 "1e7bb00e1aa04eedbd92d6545f363556139561cd9e1db6ac2ecd05b893c70d40"
    end
    on_intel do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-amd64.tar.gz"
      sha256 "0a1ec2faccb994b115ac5ba85741d32a860f6ad439ff1b0b84f19712dd8080fb"
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
