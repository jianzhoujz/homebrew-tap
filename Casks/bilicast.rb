cask "bilicast" do
  version "0.3.1"
  sha256 "c64acad913f3156250b3ae81c53b7cffd466b3e9f1de2b803e5f32b774c5bcb2"

  url "https://github.com/jianzhoujz/bilicast/releases/download/v#{version}/" \
      "BiliCastHelper-#{version}.dmg"
  name "BiliCastHelper"
  name "哔哩投屏助手"
  desc "Cast Bilibili web videos to local-network DLNA TVs from a menu bar"
  homepage "https://github.com/jianzhoujz/bilicast"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "BiliCastHelper.app"

  uninstall quit: "local.bilicast-helper"

  zap trash: [
    "~/Library/Application Support/BiliCastHelper",
    "~/Library/Logs/BiliCastHelper",
  ]
end
