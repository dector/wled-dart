# WLED API for Dart

![Pub Version](https://img.shields.io/pub/v/wled)

🚧 **ATTENTION!** Current version is totally usable but API might change multiple times before the 1.0 release. 🚧


## Changelog

See [CHANGELOG.md](CHANGELOG.md).


## Usage

``` dart
// Will be resolved to `http://localhost`.
final wled = Wled('localhost');
// or
final wled = Wled('127.0.0.1')

await wled.toggle();
```
