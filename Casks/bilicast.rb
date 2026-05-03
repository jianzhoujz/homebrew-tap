cask "bilicast" do
  version "0.3.0"
  sha256 "90ed670a5d8cc735513f5ffb2f7855a9295b4a0a99d139e0115172ec15a17e17"

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
