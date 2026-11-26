# typed: false
# frozen_string_literal: true

class ProtocGenOmnibufNano < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Nano C99 embedded runtime"
  homepage "https://omnibuf.com/nano"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.3/protoc-gen-omnibuf-nano-darwin-arm64.tar.gz"
      sha256 "2fcdcb2d4173e65b343bb8959758d4b8486965d88a31dd39616c1e82b2649a77"
    else
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.3/protoc-gen-omnibuf-nano-darwin-amd64.tar.gz"
      sha256 "46fb458cecba4ceadb4543c553e6e6b1c319875596771a83989b069943f4f9a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.3/protoc-gen-omnibuf-nano-linux-arm64.tar.gz"
      sha256 "6fdb93a5eeb02a2fe23aaef3ff3fb5507b7ec5989eb0b6de4d2484bd26b5c575"
    else
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.3/protoc-gen-omnibuf-nano-linux-amd64.tar.gz"
      sha256 "1ffe7d011d6eb62d5df43ab677dc96fddaf55057819388b3051bbefd4756897f"
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
