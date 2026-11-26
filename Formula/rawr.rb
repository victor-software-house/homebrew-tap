class Rawr < Formula
  desc "Bring Claude Code agents back into their Rex panes after a restart"
  homepage "https://github.com/victor-software-house/rawr"
  version "0.0.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/victor-software-house/rawr/releases/download/v#{version}/rawr_#{version}_macos_arm64.tar.gz"
      sha256 "9f3c1a161978b3b7e3b10a58845d80995a15a5721754f9f3e30ae8c0ac876529"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/victor-software-house/rawr/releases/download/v#{version}/rawr_#{version}_linux_x64.tar.gz"
      sha256 "e7bb8854b78cdd3f00d943edbae73a6d72e99f3978064c52bdc50ebdc22f6dfa"
    end
  end

  def install
    bin.install "rawr"
    generate_completions_from_executable(bin/"rawr", "completion")
  end

  # The first rawr window starts the daemon when none runs.
  # brew services starts it at login instead.
  service do
    run [opt_bin/"rawr", "daemon"]
    keep_alive true
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rawr --version")
  end
end
