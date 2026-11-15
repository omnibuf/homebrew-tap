# typed: false
# frozen_string_literal: true

class ProtocGenOmnibuf < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.1/protoc-gen-omnibuf-darwin-arm64.tar.gz"
      sha256 "9d5c264015d21ff1ee76dce5d5e06ce1fefe429d8878d3bdb946e1519b775ed4"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.1/protoc-gen-omnibuf-darwin-amd64.tar.gz"
      sha256 "51ad070892d28cc399e2f7d5df6597bc7731c2da9057e73d57f8b553bfed1311"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.1/protoc-gen-omnibuf-linux-arm64.tar.gz"
      sha256 "ff9d20aa1e0dcc5109d90b7b17de68047d95c6f5a2fc92a39207e7e06a76af2a"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.1/protoc-gen-omnibuf-linux-amd64.tar.gz"
      sha256 "16f98d69a42200b41decc636e6bcbd3d59759d4d0075015bead74e01ed06b204"
    end
  end

  def install
    bin.install "protoc-gen-omnibuf"
  end

  test do
    assert_predicate bin/"protoc-gen-omnibuf", :exist?
    assert_predicate bin/"protoc-gen-omnibuf", :executable?
  end
end
