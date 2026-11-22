# typed: false
# frozen_string_literal: true

class ProtocGenOmnibuf < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.2/protoc-gen-omnibuf-darwin-arm64.tar.gz"
      sha256 "64b0e4a3df5835d2fb6ef7ded2ea28fc6fbe75b2122780736e021eafb3671cd1"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.2/protoc-gen-omnibuf-darwin-amd64.tar.gz"
      sha256 "061697fb9e8d356791ed230920fa4677f2b2b7d973626a52d1c8a680650d5427"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.2/protoc-gen-omnibuf-linux-arm64.tar.gz"
      sha256 "e1a743563bcbf53bc03353a59f8f33b8fcd9d7a5a6bc0d5e532b30958aaeaa17"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.2/protoc-gen-omnibuf-linux-amd64.tar.gz"
      sha256 "3144f4494d968199d4226786dd283bff3dabf51b2b895220645896d0919e87be"
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
