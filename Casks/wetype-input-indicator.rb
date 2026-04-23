cask "wetype-input-indicator" do
  version "1.1.0"
  sha256 "907dc7d414d7a9535c8616a9591676779b3df2250d6ffa0e129590498bc93d2d"

  url "https://github.com/jianzhoujz/input-indicator/releases/download/v#{version}/" \
      "WeTypeInputIndicator-#{version}.zip"
  name "WeType Input Indicator"
  name "微信输入法指示器"
  desc "Menu bar Chinese/English mode indicator for WeType IME"
  homepage "https://github.com/jianzhoujz/input-indicator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "WeTypeInputIndicator.app"

  uninstall quit:       "local.wetype-input-indicator",
            on_upgrade: :quit

  zap trash: [
    "~/Library/LaunchAgents/local.wetype-input-indicator.plist",
    "~/Library/Logs/WeTypeInputIndicator.log",
    "~/Library/Preferences/local.wetype-input-indicator.plist",
  ]
end
