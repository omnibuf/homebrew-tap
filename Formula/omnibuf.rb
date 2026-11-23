# typed: false
# frozen_string_literal: true

class Omnibuf < Formula
  desc "Fast, jq-style CLI and conformance runner for OmniBuf binary packets"
  homepage "https://omnibuf.com"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.3/omnibuf-darwin-arm64.tar.gz"
      sha256 "83a83b44c1b402852fd5498a9dc9d8093c7efbaea35e0b94e4539abe04f0c743"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.3/omnibuf-darwin-amd64.tar.gz"
      sha256 "226ab48e9377fd61e23bbe78edfa3148a1babc87cc3bfbceffd5f110d2decf1c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.3/omnibuf-linux-arm64.tar.gz"
      sha256 "843ffc3dcbb31dcf3680f05ec1a8458d2952d6a5ff0b9aff4f9e079fccbaae96"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.3/omnibuf-linux-amd64.tar.gz"
      sha256 "c5d21cea8dad1e24c4553720e3e3730d3ffdc43917269e6a3a3c736bf3768cf5"
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
