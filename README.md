# build_runner helper

![Pub Version](https://img.shields.io/pub/v/build_runner_helper)

For those tired of writing `flutter packages pub run build_runner build --delete-conflicting-outputs`. Should work both on Windows and macOS.

## Usage

Activate this package globally so you can access it as a regular command.

```
pub global activate build_runner_helper
```

Run `builder` to trigger build.

Run `builder -w` or `builder --watch` to trigger build & watch for file changes.

Run `builder --help` to show usage help.

Option `--delete-conflicting-outputs` is by enabled default. You can disable it. See help.