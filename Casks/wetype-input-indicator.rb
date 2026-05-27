cask "wetype-input-indicator" do
  version "1.3.0"
  sha256 "2565408da92cbb31b3e48eb2738cbd85f06b6bbee1f23de00b1e086303506630"

  url "https://github.com/jianzhoujz/input-indicator/releases/download/v#{version}/" \
      "WeTypeInputIndicator-#{version}.dmg"
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
