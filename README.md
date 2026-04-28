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

### Input Indicators

Menu bar utilities for macOS 12+ that show Chinese/English mode for input methods.

```bash
brew install --cask doubao-input-indicator
brew install --cask wetype-input-indicator
```

The first launch may require Input Monitoring permission:

System Settings -> Privacy & Security -> Input Monitoring

See [jianzhoujz/input-indicator](https://github.com/jianzhoujz/input-indicator) for details.
