cask "doubao-input-indicator" do
  version "1.0.3"
  sha256 "50d2890cfe3159b657dea7fe92316d0469eb0f45217be92bf9995379bd37bce0"

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

  uninstall quit:       "local.doubao-input-indicator",
            on_upgrade: :quit

  zap trash: [
    "~/Library/LaunchAgents/local.doubao-input-indicator.plist",
    "~/Library/Logs/DoubaoInputIndicator.log",
    "~/Library/Preferences/local.doubao-input-indicator.plist",
  ]
end
