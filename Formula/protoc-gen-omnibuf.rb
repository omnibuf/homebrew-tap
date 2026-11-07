# typed: false
# frozen_string_literal: true

class ProtocGenOmnibuf < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.0/protoc-gen-omnibuf-darwin-arm64.tar.gz"
      sha256 "797ba9dd64f230277063f4f9a2f188e7b42f938d669246dff7332c670452eddc"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.0/protoc-gen-omnibuf-darwin-amd64.tar.gz"
      sha256 "ba464992be1ee4457e2e7e165969f86d76ed10351984cf3ba3d67cbac5f45682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.0/protoc-gen-omnibuf-linux-arm64.tar.gz"
      sha256 "f0b56fe921c0dfd316ae28c1f3a17bf8c390c36a9710502a77f313a204cbbed2"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.1.0/protoc-gen-omnibuf-linux-amd64.tar.gz"
      sha256 "09e63a7fdcd3ad783b6df3fd5e79f6f77cad13510f0faffe8347a625d4ba7994"
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
