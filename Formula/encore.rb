class Encore < Formula
  desc "Local proxy for AI APIs with automatic retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.7"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.7/encore-0.3.7-darwin-arm64.tar.gz"
    sha256 "d5d24f9052944aab61b160b0dc0d1e495f8ed564ad46256fe78d04bb73713c8e"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.7/encore-0.3.7-darwin-amd64.tar.gz"
    sha256 "816ab6b965a1d8c8e88984d57d862b4a00362d903ddca30f1bd5c168badc7186"
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
