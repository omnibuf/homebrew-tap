# typed: false
# frozen_string_literal: true

class ProtocGenOmnibuf < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.3/protoc-gen-omnibuf-darwin-arm64.tar.gz"
      sha256 "ddedc2d192470f5e2872dd855013b1675e439513be71cc021b46924018410ee2"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.3/protoc-gen-omnibuf-darwin-amd64.tar.gz"
      sha256 "e44c3ccb6ebe96ab67ad007fb22043a6746bcf77d2835035146f0dc66910e7db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.3/protoc-gen-omnibuf-linux-arm64.tar.gz"
      sha256 "2eb603c6d0983ce4d234e0ea9cc42582a83feb5dd5bf55091c2ff68a0fc03482"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.3/protoc-gen-omnibuf-linux-amd64.tar.gz"
      sha256 "9197ce43e667dadd4dd5fa6d721a7895f03bf37ab325091264b88c65d2c8cb34"
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
