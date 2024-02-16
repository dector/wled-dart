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

final status = await wled.status();
print('${wled.host} => isOn: ${status.isOn}');
```

## Operations

**Implemented**: 
- [x] Turn On.
- [x] Turn Off.
- [x] Toggle.
- [x] Brightness.
- [x] Change color.

**Not implemented**:
- [ ] Effects.
- [ ] Palette.
- [ ] Nightlight.
- [ ] Advances: primary/secondary/third color.
- [ ] Advances: hue/saturation.
- [ ] Notifications.
- [ ] Presets.
- [ ] Macros.
- [ ] Segments.
- [ ] Reboot.
- [ ] Current/countdown time.
- [ ] Color slider mode.
- [ ] Debug IO.
- [ ] Internal mode.
- [ ] Lock.
- [ ] Experimental.
- [ ] Cronixie.
- [ ] Realtime UDP.
- [ ] Live data.
- [ ] Response parsing.
