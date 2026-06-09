cask "mac-browser-switch" do
  version "0.1.5"
  sha256 "8e7ee34b32aa62d45aac5ed75474e2e7e0ef1f4d74a65bf03b7fe8eb66313631"

  url "https://github.com/jianzhoujz/mac-browser-switch/releases/download/v#{version}/" \
      "BrowserSwitch-#{version}.dmg"
  name "BrowserSwitch"
  desc "Menu bar utility to switch the default browser quickly"
  homepage "https://github.com/jianzhoujz/mac-browser-switch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "BrowserSwitch.app"

  uninstall quit:       "local.mac-browser-switch",
            on_upgrade: :quit

  zap trash: [
    "~/Library/LaunchAgents/local.mac-browser-switch.plist",
    "~/Library/Logs/BrowserSwitch.log",
    "~/Library/Preferences/local.mac-browser-switch.plist",
  ]
end
