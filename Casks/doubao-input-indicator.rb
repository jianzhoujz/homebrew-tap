cask "doubao-input-indicator" do
  version "1.3.0"
  sha256 "cbaf5928600ed01c50251495fd628b8fccdca8810dd04128ed7adbacf5fe1c4e"

  url "https://github.com/jianzhoujz/input-indicator/releases/download/v#{version}/" \
      "DoubaoInputIndicator-#{version}.dmg"
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

  uninstall quit:       "local.doubao-input-indicator",
            on_upgrade: :quit

  zap trash: [
    "~/Library/LaunchAgents/local.doubao-input-indicator.plist",
    "~/Library/Logs/DoubaoInputIndicator.log",
    "~/Library/Preferences/local.doubao-input-indicator.plist",
  ]
end
