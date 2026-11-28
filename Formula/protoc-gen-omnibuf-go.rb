# typed: false
# frozen_string_literal: true

class ProtocGenOmnibufGo < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.2.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.14/protoc-gen-omnibuf-go-darwin-arm64.tar.gz"
      sha256 "dd98930c8bf3a96b158a31a75d25c0386cf8cac9adf8644dc4fd7077abb9f99d"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.14/protoc-gen-omnibuf-go-darwin-amd64.tar.gz"
      sha256 "e19d203e783d037b8620cdbcb7d632e11a586aa754a3cb1c0f585ae804cb7504"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.14/protoc-gen-omnibuf-go-linux-arm64.tar.gz"
      sha256 "d56c4c75c4fe0910f026fa11d6b81b1547acad0deea2bc52faa9ca69a6d35fe5"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.14/protoc-gen-omnibuf-go-linux-amd64.tar.gz"
      sha256 "793aa165a168a5c6a6809eac257bfe54014809b5398171744efb35a6e1caca1c"
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
