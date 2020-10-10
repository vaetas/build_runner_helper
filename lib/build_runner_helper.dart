import 'dart:io';

import 'package:args/args.dart';

const _kHelpFlag = 'help';
const _kBuildFlag = 'build';
const _kWatchFlag = 'watch';
const _kDeleteConflictingOutputsFlag = 'delete-conflicting-outputs';

/// Start `build_runner` with optional [args].
///
/// When [args] are empty `build_runner build` is started.
void startBuildRunner(List<String> args) {
  final parser = ArgParser();
  parser
    ..addFlag(
      _kHelpFlag,
      abbr: 'h',
      help: 'Shows usage help.',
      negatable: false,
      hide: true,
    )
    ..addFlag(
      _kBuildFlag,
      abbr: 'b',
      help: 'Runs a single build and exits. Default behavior when no flags '
          'are provided.',
      negatable: false,
      defaultsTo: true,
    )
    ..addFlag(
      _kWatchFlag,
      abbr: 'w',
      help: 'Runs a persistent build server that watches the files '
          'system for edits and does rebuilds as necessary.',
      negatable: false,
      defaultsTo: false,
    )
    ..addFlag(
      _kDeleteConflictingOutputsFlag,
      abbr: 'd',
      help: 'Assume conflicting outputs in the users package are from previous '
          'builds, and skip the user prompt that would usually be provided.',
      negatable: true,
      defaultsTo: true,
    );

  final results = parser.parse(args);

  if (results[_kHelpFlag]) {
    print(parser.usage);
  } else if (results[_kWatchFlag]) {
    print('Running build_runner watch...');
    _runCommand(
      _kWatchFlag,
      deleteConflictingOutputs: results[_kDeleteConflictingOutputsFlag],
    );
  } else if (results[_kBuildFlag]) {
    print('Running build_runner build...');
    _runCommand(
      _kBuildFlag,
      deleteConflictingOutputs: results[_kDeleteConflictingOutputsFlag],
    );
  } else {
    print('Invalid arguments: $args');
  }
}

void _printResult(ProcessResult result) {
  print(result.stdout);
  print(result.stderr);
}

void _runCommand(String param, {bool deleteConflictingOutputs = true}) {
  Process.run(
    'flutter packages pub run build_runner',
    [
      param,
      if (deleteConflictingOutputs) '--delete-conflicting-outputs',
    ],
    runInShell: true,
  ).then(_printResult);
}
