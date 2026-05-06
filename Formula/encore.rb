class Encore < Formula
  desc "Local proxy for AI APIs with automatic retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.5"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.5/encore-0.3.5-darwin-arm64.tar.gz"
    sha256 "76a40055bf47de32e8a8d1067d52f2210880b836a812bb38310c38c116f1fa22"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.5/encore-0.3.5-darwin-amd64.tar.gz"
    sha256 "fb4897389aaed928465fdece5c44ca3b5ad729c3c649d85295b0b86750c2a461"
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
