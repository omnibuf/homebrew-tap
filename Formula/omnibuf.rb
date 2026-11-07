# typed: false
# frozen_string_literal: true

class Omnibuf < Formula
  desc "Fast, jq-style CLI and conformance runner for OmniBuf binary packets"
  homepage "https://omnibuf.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.0/omnibuf-darwin-arm64.tar.gz"
      sha256 "0d02f7cd444b15d0987a8255cd89b496940e6fd60c46f1d03b8a30468300edf1"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.0/omnibuf-darwin-amd64.tar.gz"
      sha256 "3cfecf165a18d8062558a22409868a56e4312cb08d21006b1762c513ced167ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.0/omnibuf-linux-arm64.tar.gz"
      sha256 "3f5fdd004ebc78e2e5a5109432e5871cd421cd9752ae8158105a4aca9513118a"
    else
      url "https://github.com/omnibuf/omnibuf-cli/releases/download/v0.1.0/omnibuf-linux-amd64.tar.gz"
      sha256 "6203788fb606b425a94d1d5346e78bc408c76e33981003c9dc2dbcfadc17a1fb"
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
