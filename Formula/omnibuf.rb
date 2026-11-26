# typed: false
# frozen_string_literal: true

class Omnibuf < Formula
  desc "Fast, jq-style CLI and conformance runner for OmniBuf binary packets"
  homepage "https://omnibuf.com"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.5/omnibuf-darwin-arm64.tar.gz"
      sha256 "c3ebd1d531079821541e642c64af201ef3a193ed99cb9405a064c5c30ed46d54"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.5/omnibuf-darwin-amd64.tar.gz"
      sha256 "d4e603362a7997d2f224a0c8a262ce86032fcb77d007be808384a2282b30e90b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.5/omnibuf-linux-arm64.tar.gz"
      sha256 "082afd708149601a26bfec2b7885ef4df5dae1d7a53d0ce37d87ae01a624a207"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.5/omnibuf-linux-amd64.tar.gz"
      sha256 "3d3b604e6d5c05596f9ebc53e673e181c6192997bac37505c87f09bccd8a44c9"
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
