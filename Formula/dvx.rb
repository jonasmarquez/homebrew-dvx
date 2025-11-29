class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.18.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.0/dvx_0.18.0_darwin_arm64.tar.gz"
      sha256 "f54dc4b7251af53e3445a3d89d2c123f4043c955e5f7fbf17c1e53363f3117c8"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.0/dvx_0.18.0_darwin_amd64.tar.gz"
      sha256 "18978d9da0a2c4313c5dfe3faa1f1d19d33cf4a45e35ae2baabc40ea26e2c319"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.0/dvx_0.18.0_linux_amd64.tar.gz"
      sha256 "d626a8dff3c3730f3139e55285e4743bf1ef3e204a627aa1b8946885e4fa9fc8"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.18.0/dvx_0.18.0_linux_arm64.tar.gz"
      sha256 "573c777f389a1f0df3b2311efee9b362d431d966379436a74dd4644f8aacd776"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.18.0", output
  end
end