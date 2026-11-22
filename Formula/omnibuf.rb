# typed: false
# frozen_string_literal: true

class Omnibuf < Formula
  desc "Fast, jq-style CLI and conformance runner for OmniBuf binary packets"
  homepage "https://omnibuf.com"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/archive/refs/tags/v0.1.2.tar.gz"
      sha256 "b6332317dc50772e47f0e05c38d451ae5c38049f07e583dc9d6974dc0d2079d7"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.1/omnibuf-darwin-amd64.tar.gz"
      sha256 "7e32279a21ed4f9ef2a84b69aee769b640baf3cbcf31275d31e95cc83392aaca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.1/omnibuf-linux-arm64.tar.gz"
      sha256 "de0c599e0f58bc7d2bf5aad8afd66c0867099ebe673228da8a517c7ffeedf1ec"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.1/omnibuf-linux-amd64.tar.gz"
      sha256 "2f48b980fc27ce80572410a1df3439ff4609df7bb8bd4d4b9458e6df2659097b"
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
