# homebrew-tap

Homebrew tap (`omnibuf/tap`) distributing the [OmniBuf](https://omnibuf.com) CLI and `protoc` plugins. Part of the [OmniBuf tooling suite](https://omnibuf.com/tooling).

## Install

```bash
# OmniBuf CLI inspector and conformance runner
brew install omnibuf/tap/omnibuf

# Go protoc / buf code generator plugin
brew install omnibuf/tap/protoc-gen-omnibuf

# C99 embedded Nano protoc code generator plugin
brew install omnibuf/tap/protoc-gen-omnibuf-nano
```

## Upgrade

```bash
brew update
brew upgrade omnibuf protoc-gen-omnibuf protoc-gen-omnibuf-nano
```

## Formulas

| Formula | Binary | Source |
| :--- | :--- | :--- |
| `omnibuf` | `omnibuf` | [`omnibuf/omnibuf-cli`](https://github.com/omnibuf/omnibuf-cli) |
| `protoc-gen-omnibuf` | `protoc-gen-omnibuf` | [`omnibuf/omnibuf-go`](https://github.com/omnibuf/omnibuf-go) |
| `protoc-gen-omnibuf-nano` | `protoc-gen-omnibuf-nano` | [`omnibuf/omnibuf-nano`](https://github.com/omnibuf/omnibuf-nano) |

## License

Apache-2.0
