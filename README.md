# build_runner helper

For those tired of writing `flutter packages pub run build_runner build --delete-conflicting-outputs`. Should work both on Windows and macOS.

## Usage

Activate this package globally so you can access it as a regular command.

```
pub global activate build_runner_helper
```

Run `builder` to trigger build.

Run `builder -w` to trigger build & watch for file changes.