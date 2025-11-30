class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.20.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.20.0/dvx_0.20.0_darwin_arm64.tar.gz"
      sha256 "a678b9353237391c1647eb35511e2a8dafb2481bfdfabdc8c44b25c9535429eb"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.20.0/dvx_0.20.0_darwin_amd64.tar.gz"
      sha256 "8af3f879056c303544d69810f9f1112ed5d1e5c64f82f6bce81412320af30094"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.20.0/dvx_0.20.0_linux_amd64.tar.gz"
      sha256 "c27918f57170f5016180ece355168ad633b7d7aea4bde3d16193cb3f36b99c40"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.20.0/dvx_0.20.0_linux_arm64.tar.gz"
      sha256 "81bef3e8a52d8d7e3e3493f6204c201bc9c72702afdd75b04ada49d6728d07ee"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.20.0", output
  end
end