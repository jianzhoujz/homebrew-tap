# Cross-platform Wails build of BiliCast.
# Coexists with the native `bilicast` cask — distinct .app name and bundle ID.
cask "bilicast-wails" do
  version "0.4.13"
  sha256 "0da332a5accca4333b39f5b9d93720a22066dd34cbaced9484f1d347f7921dd4"

  url "https://github.com/jianzhoujz/bilicast/releases/download/v#{version}/" \
      "BiliCast-macOS-universal-wails.dmg"
  name "BiliCast (Wails)"
  name "哔哩投屏（Wails 版）"
  desc "Cast Bilibili web videos to DLNA TVs — cross-platform Wails build"
  homepage "https://github.com/jianzhoujz/bilicast"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "BiliCast-wails.app"

  uninstall quit:       "com.wails.bilicast-wails",
            on_upgrade: :quit

  zap trash: [
    "~/Library/Caches/com.wails.bilicast-wails",
    "~/Library/Preferences/com.wails.bilicast-wails.plist",
    "~/Library/Saved Application State/com.wails.bilicast-wails.savedState",
    "~/Library/WebKit/com.wails.bilicast-wails",
  ]
end
