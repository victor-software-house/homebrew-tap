# homebrew-tap

Homebrew tap for the tools of Victor Software House.
Each Mac app's release workflow publishes a signed, notarized `.pkg`, and the cask here installs it.
Each command-line tool's release publishes a tarball per platform, and the formula here installs the one for your machine.

## Casks

| Cask | App | Releases |
|:--|:--|:--|
| `signd` | signd, an SSH agent whose keys only its signed app can use | [victor-software-house/signd](https://github.com/victor-software-house/signd/releases) |

## Formulae

| Formula | Tool | Releases |
|:--|:--|:--|
| `rawr` | rawr, which brings Claude Code agents back into their Rex panes after a restart | [victor-software-house/rawr](https://github.com/victor-software-house/rawr/releases) |

## Install

```bash
brew install --cask victor-software-house/tap/signd
brew install victor-software-house/tap/rawr
```

## Updates

A release job sends a `release` dispatch here after it uploads its files.
Its payload names the cask or the formula, the tag, the release's repository and the asset.
A formula names one asset per platform, one per line.
`.github/workflows/bump.yml` then sets the version and each sha256, and opens and merges the pull request as the Version Packages App.
A manual run with the same values bumps a cask or a formula again.
