cask "mac-browser-switch" do
  version "0.1.4"
  sha256 "3615260363f5136d4af15d9092d22f9a64aa5c92a6a7664858f8bf0e563e2a13"

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
