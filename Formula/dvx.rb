class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.16.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.1/dvx_0.16.1_darwin_arm64.tar.gz"
      sha256 "8d298ad4bd8ccae24e8c43133a39bf3232dcbf95171ae54b257a14f67a519bad"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.1/dvx_0.16.1_darwin_amd64.tar.gz"
      sha256 "988fa1e1d87fb5cfd35f209b81e5458443bb43d9b8b198c742265a626cd9c92b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.1/dvx_0.16.1_linux_amd64.tar.gz"
      sha256 "2909ff36939c843037a65c70820aab88a1deee993727dd4f2e021dc3975bf72b"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.1/dvx_0.16.1_linux_arm64.tar.gz"
      sha256 "a4fc9026d8227f7f95d1a161a71eb230ec8efa868044e664df971c5ae38e2bf3"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.16.1", output
  end
end