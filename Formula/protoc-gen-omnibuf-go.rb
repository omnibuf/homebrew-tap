# typed: false
# frozen_string_literal: true

class ProtocGenOmnibufGo < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.2.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.7/protoc-gen-omnibuf-darwin-arm64.tar.gz"
      sha256 "4684b833bbcb3ca8f06e05b9b4b3b6a752b999ee0e1c1cbdfa12a14d8c37a2d6"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.7/protoc-gen-omnibuf-darwin-amd64.tar.gz"
      sha256 "d9b5f5abc0de400fdab50ada25982517e523c485024415c4280de34c04470e30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.7/protoc-gen-omnibuf-linux-arm64.tar.gz"
      sha256 "082a5c4fb798b340f0e3f8e3ee18c15ce4ff402ebf1b49038bc3097f0878234f"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.7/protoc-gen-omnibuf-linux-amd64.tar.gz"
      sha256 "48abac22bb2dffcd0aa96b2297ccb43b01741988a18c19711312f000658904b8"
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
