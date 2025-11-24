class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.12.0/dvx_0.12.0_darwin_arm64.tar.gz"
      sha256 "2f184801bd52bbcb9502b7933bf1fc2afd519bf336911cea51bef79d5dbfd5de"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.12.0/dvx_0.12.0_darwin_amd64.tar.gz"
      sha256 "fdaad6c7833e929ebd3e32309caeb89ce3ad0d3f314b1ad55ed9c7370c0ab8b2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.12.0/dvx_0.12.0_linux_amd64.tar.gz"
      sha256 "ba5df88aa2ec57234ba9f15d6a3141ad1a2a89c68099ec0577abbf21a09315de"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.12.0/dvx_0.12.0_linux_arm64.tar.gz"
      sha256 "d1a2d5d65cdf826f5fc9e0a36597b218a35e0343ae0c28ada3ef247ad66dfb2a"
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