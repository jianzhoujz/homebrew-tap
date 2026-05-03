cask "bilicast" do
  version "0.4.3"
  sha256 "ac7e07a7a61fde1c0b74431923d8e5dccf192037bd6417741f772ae2e5c43eec"

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
