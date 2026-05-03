cask "bilicast" do
  version "0.4.1"
  sha256 "ce86d80330ac64f6b8300ea748d0d5d05abb072833b2a4be6e99bfe28b80d600"

  url "https://github.com/jianzhoujz/bilicast/releases/download/v#{version}/" \
      "BiliCast-#{version}.dmg"
  name "BiliCast"
  name "哔哩投屏"
  desc "Cast Bilibili web videos to local-network DLNA TVs from a menu bar"
  homepage "https://github.com/jianzhoujz/bilicast"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "BiliCast.app"

  uninstall quit: "local.bilicast"

  zap trash: [
    "~/Library/Application Support/BiliCast",
    "~/Library/Logs/BiliCast",
  ]
end
