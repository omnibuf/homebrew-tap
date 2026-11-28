# homebrew-tap

[![CI](https://github.com/omnibuf/homebrew-tap/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/omnibuf/homebrew-tap/actions/workflows/ci.yml?query=branch%3Amain)
[![License: Apache-2.0](https://img.shields.io/badge/License-Apache--2.0-blue.svg)](./LICENSE)
[![Website](https://img.shields.io/badge/website-omnibuf.com-111111?style=flat&labelColor=111111&color=D4FF33)](https://omnibuf.com/tooling)

Homebrew tap (`omnibuf/tap`) distributing the [OmniBuf](https://omnibuf.com) CLI and `protoc` plugins. Part of the [OmniBuf tooling suite](https://omnibuf.com/tooling).

## Install

```bash
# OmniBuf CLI inspector and conformance runner
brew install omnibuf/tap/omnibuf

# Go protoc / buf code generator plugin
brew install omnibuf/tap/protoc-gen-omnibuf-go

# C99 embedded Nano protoc code generator plugin
brew install omnibuf/tap/protoc-gen-omnibuf-nano
```

## Upgrade

```bash
brew update
brew upgrade omnibuf protoc-gen-omnibuf-go protoc-gen-omnibuf-nano
```

## Formulas

| Formula | Binary | Source |
| :--- | :--- | :--- |
| `omnibuf` | `omnibuf` | [`omnibuf/omnibuf-cli`](https://github.com/omnibuf/omnibuf-cli) |
| `protoc-gen-omnibuf-go` | `protoc-gen-omnibuf-go` | [`omnibuf/omnibuf-go`](https://github.com/omnibuf/omnibuf-go) |
| `protoc-gen-omnibuf-nano` | `protoc-gen-omnibuf-nano` | [`omnibuf/omnibuf-nano`](https://github.com/omnibuf/omnibuf-nano) |

## License

Apache-2.0
