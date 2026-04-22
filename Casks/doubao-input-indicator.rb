cask "doubao-input-indicator" do
  version "1.0.2"
  sha256 "e5dd236ef93011a56fa1a3c78f48f6309e22def2056f46c70cf572b1c3114800"

  url "https://github.com/jianzhoujz/input-indicator/releases/download/v#{version}/" \
      "DoubaoInputIndicator-#{version}.zip"
  name "Doubao Input Indicator"
  name "豆包输入法指示器"
  desc "Menu bar Chinese/English mode indicator for Doubao IME"
  homepage "https://github.com/jianzhoujz/input-indicator"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "DoubaoInputIndicator.app"

  uninstall launchctl: "local.doubao-input-indicator",
            quit:      "local.doubao-input-indicator",
            delete:    "~/Library/LaunchAgents/local.doubao-input-indicator.plist"

  zap trash: [
    "~/Library/Logs/DoubaoInputIndicator.log",
    "~/Library/Preferences/local.doubao-input-indicator.plist",
  ]
end
