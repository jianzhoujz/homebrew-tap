cask "doubao-input-indicator" do
  version "1.2.0"
  sha256 "47669522321ebba1deeb551a5a932db405eb52282d48f1ed89e3bc195379e9a6"

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
