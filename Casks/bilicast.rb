cask "bilicast" do
  version "0.4.3"
  sha256 "990d805d9879dcc645d42eb14fb96f1dcd33d9d92cd8aa5fe58082765359c03c"

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

  uninstall quit:       "local.bilicast",
            on_upgrade: :quit

  zap trash: [
    "~/Library/Application Support/BiliCast",
    "~/Library/Logs/BiliCast",
  ]
end
