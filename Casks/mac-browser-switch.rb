cask "mac-browser-switch" do
  version "0.1.1"
  sha256 "f273be61a7c1a2edd5e746de67b6b26ec6727ea3704ee4e183038c4376e6f565"

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
