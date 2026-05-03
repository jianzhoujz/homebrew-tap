cask "dns-chain" do
  version "0.1.0"
  sha256 "4a0eced7b771bf2f37e8357e51079e51562831af14ffba1af8b45ae75cffe114"

  url "https://github.com/jianzhoujz/dns-chain/releases/download/v#{version}/" \
      "DNSChain-#{version}.dmg"
  name "DNSChain"
  desc "Menu bar local DNS-over-HTTPS gateway with chained fallback"
  homepage "https://github.com/jianzhoujz/dns-chain"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "DNSChain.app"

  uninstall quit:       "local.dns-chain",
            on_upgrade: :quit

  zap trash: [
    "~/.config/dns-chain",
    "~/Library/Application Support/DNSChain",
    "~/Library/Application Support/DNS Chain",
    "~/Library/LaunchAgents/com.dns-chain.launch.plist",
  ]
end
