# Homebrew Tap

Personal Homebrew tap for [jianzhoujz](https://github.com/jianzhoujz) projects.

## Install

```bash
brew tap jianzhoujz/tap
```

## Formulae

### Encore

Local proxy for free AI APIs (NVIDIA NIM, etc.) with automatic rate-limit retry.

```bash
brew install encore
```

See [jianzhoujz/encore](https://github.com/jianzhoujz/encore) for configuration and usage.

### Unquarantine

CLI tool to remove `com.apple.quarantine` extended attributes from macOS applications. Solves the "app is damaged" error for unsigned apps.

```bash
brew install unquarantine
```

Features:
- Auto-elevation: runs with sudo automatically when needed
- Scans both `/Applications` and `~/Applications`
- Supports Apple Silicon (arm64) and Intel (amd64)

See [jianzhoujz/unquarantine](https://github.com/jianzhoujz/unquarantine) for details.

## Casks

### DNS Chain

macOS menu bar local DNS-over-HTTPS gateway with chained fallback, cache, certificates, and query logs.

```bash
brew install --cask dns-chain
```

See [jianzhoujz/dns-chain](https://github.com/jianzhoujz/dns-chain) for setup and configuration.

### Input Indicators

Menu bar utilities for macOS 12+ that show Chinese/English mode for input methods.

```bash
brew install --cask doubao-input-indicator
brew install --cask wetype-input-indicator
```

The first launch may require Input Monitoring permission:

System Settings -> Privacy & Security -> Input Monitoring

See [jianzhoujz/input-indicator](https://github.com/jianzhoujz/input-indicator) for details.

### BrowserSwitch

Tiny menu bar utility for switching the system default browser without
opening System Settings.

```bash
brew install --cask mac-browser-switch
```

Clicking a browser in the menu triggers macOS's own "Do you want to change
your default web browser?" confirmation dialog — this is a system security
prompt that appears for every app (notarized or not). After confirming once
per switch, the new default is applied for both `http` and `https`.

See [jianzhoujz/mac-browser-switch](https://github.com/jianzhoujz/mac-browser-switch) for details.

### BiliCast

Cast Bilibili web videos to DLNA TVs on the local network. Two macOS builds
are available; pick **one** (or install both side-by-side — they don't conflict).

| Cask | App | Stack | Recommended for |
| --- | --- | --- | --- |
| `bilicast` | `BiliCast.app` | Native Swift menu-bar app + Go backend | Most users — smaller binary, native UI, packaged as DMG |
| `bilicast-wails` | `BiliCast-wails.app` | Cross-platform Go + Wails (WebKit) window | Verifying the cross-platform build, or if you prefer the same UI as the Windows / Linux releases |

Native build:

```bash
brew install --cask bilicast
```

Cross-platform Wails build:

```bash
brew install --cask bilicast-wails
```

Notes:

- App names and bundle IDs both differ (`BiliCast.app` /
  `com.jianzhou.bilicast` vs `BiliCast-wails.app` / `com.wails.bilicast-wails`,
  display name `BiliCast (Wails)`), so both can be installed at the same time
  without conflict.
- They share the backend config at `~/.config/BiliCast/config.json`
  (token, quality preference, etc.). Uninstalling either cask leaves this
  file alone so the other version keeps working; remove it manually if you
  want a full reset.
- Both builds ship `ffmpeg` as a sidecar binary inside the `.app`, so no
  Homebrew `ffmpeg` is required.
- Builds are ad-hoc signed; if Gatekeeper blocks the first launch, run
  `xattr -dr com.apple.quarantine /Applications/BiliCast.app` (or
  `/Applications/BiliCast-wails.app`), or install the `unquarantine`
  cask above.

See [jianzhoujz/bilicast](https://github.com/jianzhoujz/bilicast) for usage and the browser extension / userscript companions.
