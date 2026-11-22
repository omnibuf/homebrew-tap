# typed: false
# frozen_string_literal: true

class Omnibuf < Formula
  desc "Fast, jq-style CLI and conformance runner for OmniBuf binary packets"
  homepage "https://omnibuf.com"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.2/omnibuf-darwin-arm64.tar.gz"
      sha256 "af4e76b2c0982e7990d82444f96ad4dfdb10daa7b4808aa7f646b3df198dae55"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.2/omnibuf-darwin-amd64.tar.gz"
      sha256 "1dcd09f7bb3617541d35db8ce9edb1b7951473ece29c8567d17567bf29ef022c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.2/omnibuf-linux-arm64.tar.gz"
      sha256 "c08ad9409eea8d8ab65e26672dfacca27cae1903700519f8cd8e605f5571539d"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.2/omnibuf-linux-amd64.tar.gz"
      sha256 "700a9808997a22066e804e69230a85d227b3b9373d023bf341accacc3f4f9039"
    end
  end

  def install
    bin.install "omnibuf"
  end

  test do
    assert_match "omnibuf", shell_output("#{bin}/omnibuf --version")
    packet = pipe_output("#{bin}/omnibuf", '{"asn":64512,"router":"edge-01"}')
    out = pipe_output("#{bin}/omnibuf -r '.router'", packet)
    assert_equal "edge-01\n", out
  end
end
