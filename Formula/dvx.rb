class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.19.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.19.0/dvx_0.19.0_darwin_arm64.tar.gz"
      sha256 "9adfa645d489440478140685858fe85c0d493c0303eea02287e7374368a16d09"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.19.0/dvx_0.19.0_darwin_amd64.tar.gz"
      sha256 "4716b8a26c1d315ac731dff2200301e283abd6cbc31f4cef75b3e82770609407"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.19.0/dvx_0.19.0_linux_amd64.tar.gz"
      sha256 "cf03c22709cf90b61f1ff35f86031b9515115605e1e879a3bc118bed86df6fee"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.19.0/dvx_0.19.0_linux_arm64.tar.gz"
      sha256 "733c5de38af47ed512b6445fe16071c65155f78fd7375f6ab0fb38ed55f0e87c"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.19.0", output
  end
end