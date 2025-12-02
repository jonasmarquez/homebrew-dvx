class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.21.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.21.0/dvx_0.21.0_darwin_arm64.tar.gz"
      sha256 "74fabd712f4f409c6e439ad3520e94c461015074c4e75a2ccef02e3314699ba7"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.21.0/dvx_0.21.0_darwin_amd64.tar.gz"
      sha256 "7fce04d454ac1da933e25d3bda91fe0c8f1e9bd4c21fdd06107df4dd1ccdc224"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.21.0/dvx_0.21.0_linux_amd64.tar.gz"
      sha256 "d196a7561c9d7ea11646f0cc6af95aeadd864511c1d77c7c1a3ca614ee7f3445"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.21.0/dvx_0.21.0_linux_arm64.tar.gz"
      sha256 "32a731f90f39eb78d968c88755efca71a0fc08b85c16c3be133ebdc3997544f3"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.21.0", output
  end
end