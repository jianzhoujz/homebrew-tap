class Encore < Formula
  desc "Encore CLI tool"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.1"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.1/encore-0.3.1-darwin-arm64.tar.gz"
    sha256 "963aab13d219a582e5604caa1af010d341695ff37197fe3cfead8d79bc7a1ae5"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.1/encore-0.3.1-darwin-amd64.tar.gz"
    sha256 "70370a1b958e23827e209da59a013bf73d6af0521cf44564d11a35eaf3e8aaca"
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
