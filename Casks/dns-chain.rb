cask "dns-chain" do
  version "0.1.0"
  sha256 "a889be56739d70049ecc65d3f810074f600223cb85c42193fdabf435e842176b"

  url "https://github.com/jianzhoujz/dns-chain/releases/download/v#{version}/" \
      "DNSChain-#{version}.dmg"
  name "DNS Chain"
  desc "Menu bar local DNS-over-HTTPS gateway with chained fallback"
  homepage "https://github.com/jianzhoujz/dns-chain"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "DNS Chain.app"

  uninstall quit:       "local.dns-chain",
            on_upgrade: :quit

  zap trash: [
    "~/.config/dns-chain",
    "~/Library/Application Support/DNS Chain",
    "~/Library/LaunchAgents/com.dns-chain.launch.plist",
  ]
end
