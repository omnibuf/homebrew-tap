# typed: false
# frozen_string_literal: true

class ProtocGenOmnibuf < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Go implementation"
  homepage "https://omnibuf.com/go"
  version "0.2.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.10/protoc-gen-omnibuf-darwin-arm64.tar.gz"
      sha256 "f111bddce0fa2b0c7cd6bbfbfb0de65968b839a86ce3ee85db14129b27125bfa"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.10/protoc-gen-omnibuf-darwin-amd64.tar.gz"
      sha256 "0fc1bbc5dd9042d5efc6ad0a8aab2258e8853fa6abc8bf0529db8cbd61039105"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.10/protoc-gen-omnibuf-linux-arm64.tar.gz"
      sha256 "2205e8bc3ef36fd1e042e4bc7cf52f633d62adc159ad416274aadb553c2fa4f9"
    else
      url "https://github.com/omnibuf/omnibuf-go/releases/download/v0.2.10/protoc-gen-omnibuf-linux-amd64.tar.gz"
      sha256 "1bc25d9c6207b7d3952c96f375328ad8990fbccbc1a991b84c30f8e4796ccab3"
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
