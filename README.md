# homebrew-tap

Homebrew tap for the signed, notarized Mac apps of Victor Software House.
Each app's release workflow publishes a `.pkg`, and the cask here installs it.

## Casks

| Cask | App | Releases |
|:--|:--|:--|
| `signd` | signd, an SSH agent whose keys only its signed app can use | [victor-software-house/signd](https://github.com/victor-software-house/signd/releases) |

## Install

```bash
brew install --cask victor-software-house/tap/signd
```

## Updates

An app's release job sends a `release` dispatch here after it uploads the `.pkg`.
Its payload names the cask, the tag, the release's repository and the asset.
`.github/workflows/bump.yml` then sets the cask's version and sha256, and opens and merges the pull request as the Version Packages App.
A manual run with the same four values bumps a cask again.
