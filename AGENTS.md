# homebrew-tap

A public Homebrew tap: one cask per signed Mac app in `Casks/`, and the workflow that bumps them.

## Rules

1. This repository is public: no host names, client names, private repository links, account IDs or personal details in files, commits or pull requests.
2. A cask here installs only an app whose releases are public, and downloads its `.pkg` from the app's GitHub release.
3. A cask enters `Casks/` at a released version, with that release's digest.
   After that, `version` and `sha256` change only through `.github/workflows/bump.yml`, which checks the downloaded `.pkg` against the release's own digest.
4. `main` takes changes only through a pull request and the merge queue, and `brew style` must pass first.
   A pull request body fills the organization's template: Motivation, Change, Verification.
5. The shared template owns the files `.copier-answers.yml` records; change them through `copier update`, not by hand.
6. Pin every action to a full commit SHA, with its version in a comment.
