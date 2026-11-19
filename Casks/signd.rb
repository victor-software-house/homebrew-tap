cask "signd" do
  version "0.0.9"
  sha256 "156ee542ee033653f0fd59e7419d439acb9f04f1cc4196afab8a6109702edbf0"

  url "https://github.com/victor-software-house/signd/releases/download/v#{version}/signd.pkg"
  name "signd"
  desc "SSH agent for keys held by the Secure Enclave"
  homepage "https://github.com/victor-software-house/signd"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  # The package links /usr/local/bin/signd to the app, so the cask links no binary of its own.
  pkg "signd.pkg"

  # The link goes only while it still points into the app.
  uninstall_postflight_steps do
    remove "/usr/local/bin/signd",
           sudo:                    :if_needed,
           symlink_target_contains: "/Applications/Signd.app/Contents/MacOS/signd"
  end

  # signd service disable unregisters the login item, and launchd's job with it, while the app is still there.
  # Neither uninstall nor zap touches the keys: they stay in the keychain and in iCloud,
  # and `signd key delete` removes them.
  uninstall early_script: {
              executable:   "/Applications/Signd.app/Contents/MacOS/signd",
              args:         ["service", "disable"],
              must_succeed: false,
            },
            pkgutil:      "com.victor-software-house.signd.pkg",
            delete:       "/Applications/Signd.app"

  zap trash: [
    "~/.ssh/signd",
    "~/Library/Application Support/signd",
  ]
end
