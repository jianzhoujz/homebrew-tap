cask "wetype-input-indicator" do
  version "1.0.0"
  sha256 "24d4d730d21482a1b758629b49e66d43ccf8c796270fcbdfe15981f29ad76cb3"

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
