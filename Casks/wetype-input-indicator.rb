cask "wetype-input-indicator" do
  version "1.0.1"
  sha256 "86eafb3b11e8b5b044c4a6542827db8b45c8ca7491e4da9a06c018d1e99d10fa"

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

  uninstall launchctl: "local.wetype-input-indicator",
            quit:      "local.wetype-input-indicator",
            delete:    "~/Library/LaunchAgents/local.wetype-input-indicator.plist"

  zap trash: [
    "~/Library/Logs/WeTypeInputIndicator.log",
    "~/Library/Preferences/local.wetype-input-indicator.plist",
  ]
end
