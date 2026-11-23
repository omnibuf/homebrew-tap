# typed: false
# frozen_string_literal: true

class ProtocGenOmnibufNano < Formula
  desc "Protocol Buffers compiler plugin for the OmniBuf Nano C99 embedded runtime"
  homepage "https://omnibuf.com/nano"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.0/protoc-gen-omnibuf-nano-darwin-arm64.tar.gz"
      sha256 "dfd8046f7acb4a6fec67e7b6d174f237be58faee0528ade3c9cefe8e55908a30"
    else
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.0/protoc-gen-omnibuf-nano-darwin-amd64.tar.gz"
      sha256 "28e51cf7ef2edbe0d8596fcc2d724eebfdba6b2c88b1ec01679ba78d2a9089b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.0/protoc-gen-omnibuf-nano-linux-arm64.tar.gz"
      sha256 "9ca341fda15604ccb0cbe93d2c704d0e88ad9019a534a2462563efb0625bc069"
    else
      url "https://github.com/omnibuf/omnibuf-nano/releases/download/v0.1.0/protoc-gen-omnibuf-nano-linux-amd64.tar.gz"
      sha256 "3e0629af7a6233ff810ff0d40737590f33f49f5f9023cf4179c60b2dee39c129"
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
