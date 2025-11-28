class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.0/dvx_0.16.0_darwin_arm64.tar.gz"
      sha256 "5b58339857ce893ce676f443067d9e2bb02a95c31ea9c3c0bd07d0ad16e2d1e7"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.0/dvx_0.16.0_darwin_amd64.tar.gz"
      sha256 "a17366a4a11964425f1a68fcb4da376b3b795746b17a45019b9a42860e6356d7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.0/dvx_0.16.0_linux_amd64.tar.gz"
      sha256 "f1909f0012ae9e145a384769c9cda36bf58d5eab2c5cd726758f8783ba279fa3"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.16.0/dvx_0.16.0_linux_arm64.tar.gz"
      sha256 "c3dd2319cba68e15d37ef0d67a227c5bb8f642d93dc9742a4632fbb104fc26d7"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.16.0", output
  end
end