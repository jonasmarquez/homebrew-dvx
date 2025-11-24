class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/<jonasmarquez>/dvx-bin"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.12.0/dvx_0.12.0_darwin_arm64.tar.gz"
      sha256 "d32950c9947d213155d82e2f079a4ff72f979c95ee309a13a0184523aed1e544"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.12.0/dvx_0.12.0_linux_amd64.tar.gz"
      sha256 "7e717ed312718a7e66f1218e7a6206d94c6494cde5779393ac495dbf9a2fefb3"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx", output
  end
end