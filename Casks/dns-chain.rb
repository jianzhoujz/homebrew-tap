cask "dns-chain" do
  version "0.1.1"
  sha256 "f8a80929e7a0e7dcd1a1f2e3b5ce6fe2519e702c0db0d253db937a2a42d95ae9"

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
