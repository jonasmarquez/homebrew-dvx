class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.13.0/dvx_0.13.0_darwin_arm64.tar.gz"
      sha256 "3cfc9669af85f25ca26328335ca7b66c9da9c8b84053338e6bd7683526424f1d"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.13.0/dvx_0.13.0_darwin_amd64.tar.gz"
      sha256 "f0e63180324a963cb786b298b82fb572529d61c6aab09ad47d7be362f075e090"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.13.0/dvx_0.13.0_linux_amd64.tar.gz"
      sha256 "79589477323c1345bfd34ce02f59edb33da59464dfc88e3e0c25e3e749b4be0d"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.13.0/dvx_0.13.0_linux_arm64.tar.gz"
      sha256 "0bcecbff88a6a0c315dc4951d6b0e09ab6e5a4f931160285f2ddef708af37172"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.13.0", output
  end
end