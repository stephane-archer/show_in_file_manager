import 'dart:io';

import 'package:open_file_macos/open_file_macos.dart';
import 'package:path/path.dart' as path_lib;

Future<void> showInFileManager(final String path) async {
  final FileSystemEntityType fileSystemEntityType = FileSystemEntity.typeSync(
    path,
  );
  if (fileSystemEntityType == FileSystemEntityType.notFound) {
    throw PathNotFoundException(path, const OSError());
  }
  if (Platform.isMacOS) {
    await _showInFinder(path);
    return;
  }
  if (Platform.isWindows) {
    await _showInExplorer(path);
    return;
  }
  throw UnsupportedError("Unsupported Platform");
}

Future<void> _showInExplorer(String path) async {
  // make compatible Windows path (/ -> \)
  path = path_lib.normalize(path);
  await Process.run('cmd.exe', [
    '/c',
    'start',
    'explorer.exe',
    '/select,',
    path,
  ]);
}

Future<void> _showInFinder(String path) async {
  if (!path_lib.isAbsolute(path)) {
    path = path_lib.absolute(path);
  }
  final openFileMacosPlugin = OpenFileMacos();
  await openFileMacosPlugin.open(path, viewInFinder: true);
}
