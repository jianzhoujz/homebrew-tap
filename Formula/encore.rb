class Encore < Formula
  desc "Local proxy for free AI APIs with automatic rate-limit retry"
  homepage "https://github.com/jianzhoujz/encore"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-arm64.tar.gz"
      sha256 "316185a774b2dc3d738e2091b51a22616aa9eac185d0e93ce5144159481e9f2e"
    end
    on_intel do
      url "https://github.com/jianzhoujz/encore/releases/download/v#{version}/encore-#{version}-darwin-amd64.tar.gz"
      sha256 "fb9216f45ddba309559dcb169898ed1545e19f900c2f6047f9bb57f09dde73e1"
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
