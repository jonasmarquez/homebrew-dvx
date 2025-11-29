class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.17.0/dvx_0.17.0_darwin_arm64.tar.gz"
      sha256 "77fc2b3a232c9ee3484fd2ca6c577f1b350f8cecfa11dd1cdd882c8e36782e2d"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.17.0/dvx_0.17.0_darwin_amd64.tar.gz"
      sha256 "5911db82009b96ab3c51c7cad5b87eff8c9394a6160a564eae16f775873c4926"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.17.0/dvx_0.17.0_linux_amd64.tar.gz"
      sha256 "183876e031fe5a73339a23980211ea116b7e26a6a603276c5274dc710053f159"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.17.0/dvx_0.17.0_linux_arm64.tar.gz"
      sha256 "07b27f7e3e944e6728bacec0bb40c2b915e9b2e9f561fd092794f5ee51287a56"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.17.0", output
  end
end