# typed: false
# frozen_string_literal: true

class ProtocGenOmnibufGo < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.2.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.11/protoc-gen-omnibuf-go-darwin-arm64.tar.gz"
      sha256 "11d73c7915b7df94c93c1d57b016967e031a476adac355525c763fc003fc2358"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.11/protoc-gen-omnibuf-go-darwin-amd64.tar.gz"
      sha256 "dcc25d2c2f62049c476493fef2c7076409e0b6bb7bbd87fadd88def556bef8f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.11/protoc-gen-omnibuf-go-linux-arm64.tar.gz"
      sha256 "fd2430dcc50c265001b2139c579e59b10210efbf008e9810457873c58c2cd333"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.11/protoc-gen-omnibuf-go-linux-amd64.tar.gz"
      sha256 "540c491d7c4d675a935681881ff2144d2b43f3a77a483b5150f3ac92a17c5e04"
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
