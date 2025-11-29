class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.18.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.1/dvx_0.18.1_darwin_arm64.tar.gz"
      sha256 "04675252ae432770e4223d2669d27ca386addfafb8ecac152c60d1ac75c3a08a"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.1/dvx_0.18.1_darwin_amd64.tar.gz"
      sha256 "90c58af5df7f737783f946e64de54708342f4b1dad87ff873aab0deaa1545487"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.1/dvx_0.18.1_linux_amd64.tar.gz"
      sha256 "e691edf7f7010f709080e5670f6de7896792462a081d4f69c10e67a03efa2020"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.1/dvx_0.18.1_linux_arm64.tar.gz"
      sha256 "9c4eb3692fa98fe81b7b1ff392c3f69887ea68045a2d8ae10bf868ba038dac77"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.18.1", output
  end
end