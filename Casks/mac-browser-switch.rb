cask "mac-browser-switch" do
  version "0.1.0"
  sha256 "9522cdd6cba0dd99b6cf16a2cd23db78d82b17114faf301a188d405234f04032"

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
