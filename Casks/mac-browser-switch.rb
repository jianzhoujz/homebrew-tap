cask "mac-browser-switch" do
  version "0.1.3"
  sha256 "46d5d5b231c6677564016180d2e07951c46c689c209ee7c5215e880deef443e8"

  url "https://github.com/jianzhoujz/mac-browser-switch/releases/download/v#{version}/" \
      "BrowserSwitch-#{version}.dmg"
  name "BrowserSwitch"
  desc "Menu bar utility to switch the default browser quickly"
  homepage "https://github.com/jianzhoujz/mac-browser-switch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "BrowserSwitch.app"

  uninstall quit:       "local.mac-browser-switch",
            on_upgrade: :quit

  zap trash: [
    "~/Library/LaunchAgents/local.mac-browser-switch.plist",
    "~/Library/Logs/BrowserSwitch.log",
    "~/Library/Preferences/local.mac-browser-switch.plist",
  ]
end
