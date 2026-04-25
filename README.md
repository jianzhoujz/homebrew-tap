# Homebrew Tap

Homebrew tap for the input method indicator apps in
[jianzhoujz/input-indicator](https://github.com/jianzhoujz/input-indicator).

## Install

```bash
brew tap jianzhoujz/tap
```

The apps are menu bar utilities for macOS 12 or newer:

- `doubao-input-indicator`: Chinese/English mode indicator for Doubao IME.
- `wetype-input-indicator`: Chinese/English mode indicator for WeType IME.

Install one of them:

```bash
brew install --cask doubao-input-indicator
brew install --cask wetype-input-indicator
```

The first launch may require Input Monitoring permission:

System Settings -> Privacy & Security -> Input Monitoring

## Release

Package the release assets from the sibling `input-indicator` checkout and
update the cask `version`/`sha256` fields:

```bash
scripts/package-input-indicator-release.sh 1.0.0 ../input-indicator
```

Upload the generated DMG files to the matching GitHub release:

```bash
gh release create v1.0.0 \
  ../input-indicator/dist/DoubaoInputIndicator-1.0.0.dmg \
  ../input-indicator/dist/WeTypeInputIndicator-1.0.0.dmg \
  --repo jianzhoujz/input-indicator \
  --title v1.0.0
```

Then run:

```bash
brew audit --cask --strict jianzhoujz/tap/doubao-input-indicator
brew audit --cask --strict jianzhoujz/tap/wetype-input-indicator
brew style --fix Casks/doubao-input-indicator.rb Casks/wetype-input-indicator.rb
```
