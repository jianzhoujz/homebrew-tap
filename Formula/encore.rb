class Encore < Formula
  desc "Local proxy for AI APIs with automatic retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.3.2"
  license "MIT"

  depends_on :macos

  if Hardware::CPU.arm?
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.2/encore-0.3.2-darwin-arm64.tar.gz"
    sha256 "e8a3860ad8554d3060eec33052b0e55263cbc720f9ad5f6097bb42886fdc4535"
  else
    url "https://github.com/jianzhoujz/encore/releases/download/v0.3.2/encore-0.3.2-darwin-amd64.tar.gz"
    sha256 "aa630e1fc4c0fb83689f2ba039308a65ce241831613ba512e626e10e24113180"
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
