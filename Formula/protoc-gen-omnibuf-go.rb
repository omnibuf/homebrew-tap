# typed: false
# frozen_string_literal: true

class ProtocGenOmnibufGo < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.2.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.13/protoc-gen-omnibuf-go-darwin-arm64.tar.gz"
      sha256 "bff4d2ac78a3f32915e2ec847cfef4060eeb5e4eee88b9d4f5bc5bbe8d4d8007"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.13/protoc-gen-omnibuf-go-darwin-amd64.tar.gz"
      sha256 "411dfa0b6c923a89f8dc5ea3d1be5bd4ecdb8389173c43f055ee7f0a17391308"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.13/protoc-gen-omnibuf-go-linux-arm64.tar.gz"
      sha256 "93bcc9b66ed03dcf3cec150880b6d6063578147fbefd4ef67a30a80e8a1fedb5"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.13/protoc-gen-omnibuf-go-linux-amd64.tar.gz"
      sha256 "ef5ac34a3d0f14c0dc0424e3551480dce518e78ec980f0cf656053e2871346b0"
    end
  end

  def install
    binary = File.exist?("protoc-gen-omnibuf-go") ? "protoc-gen-omnibuf-go" : "protoc-gen-omnibuf"
    bin.install binary => "protoc-gen-omnibuf-go"
  end

  test do
    assert_predicate bin/"protoc-gen-omnibuf-go", :exist?
    assert_predicate bin/"protoc-gen-omnibuf-go", :executable?
  end
end
