import 'dart:io';

const _cmdPrefix = 'flutter packages pub run build_runner';
const _cmdSuffix = '--delete-conflicting-outputs';

/// Start `build_runner` with optional [args].
///
/// When [args] are empty `build_runner build` is started.
void start(List<String> args) {
  if (args.isEmpty || args.first == 'build') {
    print('Running build_runner build...');
    _runCommand('build');
  } else if (args.first == 'watch') {
    print('Running build_runner watch...');
    _runCommand('watch');
  } else {
    print('Invalid arguments: $args');
  }
}

void _printResult(ProcessResult result) {
  print(result.stdout);
  print(result.stderr);
}

void _runCommand(String param) {
  Process.run(
    '$_cmdPrefix $param $_cmdSuffix',
    [],
    runInShell: true,
  ).then(_printResult);
}
