# typed: false
# frozen_string_literal: true

class ProtocGenOmnibufNano < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Nano C99 embedded runtime"
  homepage "https://omnibuf.com/nano"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.2/protoc-gen-omnibuf-nano-darwin-arm64.tar.gz"
      sha256 "b70cd07b8eceb3679392e8639b3e17b9ba2c816bda745a38a202bff814f58d03"
    else
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.2/protoc-gen-omnibuf-nano-darwin-amd64.tar.gz"
      sha256 "8ed3157cc8c20017c11a0880890ace30f0a2303546c550eb1ce219e264fb242d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.2/protoc-gen-omnibuf-nano-linux-arm64.tar.gz"
      sha256 "d7a1a1ff2e8ef49ad778baa6fad726f23d03b0b2b7442aac45b11048ff9e181b"
    else
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.2/protoc-gen-omnibuf-nano-linux-amd64.tar.gz"
      sha256 "beb0553a5eb1348242df2d1521e2f2a457b3150d905f33abefd233d597a1ec9c"
    end
  end

  def install
    bin.install "protoc-gen-omnibuf-nano"
  end

  test do
    assert_predicate bin/"protoc-gen-omnibuf-nano", :exist?
    assert_predicate bin/"protoc-gen-omnibuf-nano", :executable?
  end
end
