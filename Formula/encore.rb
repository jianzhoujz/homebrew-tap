class Encore < Formula
  desc "Local proxy for free AI APIs with automatic rate-limit retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-arm64.tar.gz"
      sha256 "9928ba5c1d95265991efd4fee40e792249f11923448722932edb9e8f38769c47"
    end
    on_intel do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-amd64.tar.gz"
      sha256 "50e5e816cd088ad7a0cab3194108c92712412a1f9d5e50d7f59c9f4627b44b97"
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
