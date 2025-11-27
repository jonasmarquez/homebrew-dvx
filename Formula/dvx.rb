class Dvx < Formula
  desc "Dev eXperience helper CLI to manage dimensions, envs, Kubernetes and secrets"
  homepage "https://github.com/jonasmarquez/dvx-bin"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.15.0/dvx_0.15.0_darwin_arm64.tar.gz"
      sha256 "3f2e698724e9a2bde05eefa8170c6406c9c933cbb36362dc63c6611d846cc1e8"
    elsif Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.15.0/dvx_0.15.0_darwin_amd64.tar.gz"
      sha256 "8d1191e73f80e16da5444b99fe87c6fa3f9a1ea88eb8dc676895199d4877b036"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.15.0/dvx_0.15.0_linux_amd64.tar.gz"
      sha256 "cb6a2f3df3c192c64efb013438c6c6738f425cc96a7ac47511b6ef071a5af747"
    elsif Hardware::CPU.arm?
      url "https://github.com/jonasmarquez/dvx-bin/releases/download/v0.15.0/dvx_0.15.0_linux_arm64.tar.gz"
      sha256 "ae66575153691a42695077b169e62777f09c2024d55c1f9845a795a74fc8c0dd"
    end
  end

  def install
    bin.install "dvx"
  end

  test do
    output = shell_output("#{bin}/dvx version")
    assert_match "dvx ⚙️  version 0.15.0", output
  end
end