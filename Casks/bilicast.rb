cask "bilicast" do
  version "0.4.2"
  sha256 "49c7521a0396432d6ca5bb09d6e69ec1290ec98341d9030186b88dba0d21e564"

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
