# typed: false
# frozen_string_literal: true

class Omnibuf < Formula
  desc "Fast, jq-style CLI and conformance runner for OmniBuf binary packets"
  homepage "https://omnibuf.com"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.4/omnibuf-darwin-arm64.tar.gz"
      sha256 "422480f098e1d7a659dfe7859ddae7156eed23118f524858292a7d0a763773b8"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.4/omnibuf-darwin-amd64.tar.gz"
      sha256 "76ffae8af40bb644d0151b72704d1ed0c36559220650c68371ec7ceffbb455c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.4/omnibuf-linux-arm64.tar.gz"
      sha256 "3470f055b16953e0f2e92310bfd525c70dd833fa7494b74b8094ea0a50fef232"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.4/omnibuf-linux-amd64.tar.gz"
      sha256 "a1475a4992651ca549adfec6a8d751bdb2f9d9f5f4a53cdaca0e634fdb640a1b"
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
