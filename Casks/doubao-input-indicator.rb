cask "doubao-input-indicator" do
  version "1.0.1"
  sha256 "3c8d54de440756f25a8d83479b4f813b383465e39a6812200781e0357a5c5cf7"

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
