class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.14.0/dvx_0.14.0_darwin_arm64.tar.gz"
      sha256 "47c3e53932c3853a281658ae2281bf7035332fd23cc104690f28b689ddcd64f9"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.14.0/dvx_0.14.0_darwin_amd64.tar.gz"
      sha256 "2cd0aa469eafa143c04b3ac454ab62ff80d2b9770c7fab2c7f91ffecfd0e8834"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.14.0/dvx_0.14.0_linux_amd64.tar.gz"
      sha256 "d83d2e0ccaca61e7d4be2247222a7bc364dcf93f569ff01589a8ed0b94b771a5"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.14.0/dvx_0.14.0_linux_arm64.tar.gz"
      sha256 "6133af224c43288092e1bc59e168114ef0661f139fbc548f1d8117c6ae5b2bcf"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.14.0", output
  end
end