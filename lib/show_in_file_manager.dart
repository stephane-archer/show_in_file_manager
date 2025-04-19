import 'dart:io';

import 'package:open_file_macos/open_file_macos.dart';
import 'package:path/path.dart' as path_lib;

Future<void> showInFileManager(String path) async {
  final fileSystemEntityType = FileSystemEntity.typeSync(path);
  if (fileSystemEntityType == FileSystemEntityType.notFound) {
    throw PathNotFoundException(path, OSError());
  }
  if (Platform.isMacOS) {
    _showInFinder(path);
    return;
  }
  if (Platform.isWindows) {
    // TODO: add Windows support
    return;
  }
  throw UnsupportedError("Unsupported Platform");
}

Future<void> _showInFinder(String path) async {
  if (!path_lib.isAbsolute(path)) {
    path = path_lib.absolute(path);
  }
  final openFileMacosPlugin = OpenFileMacos();
  await openFileMacosPlugin.open(path, viewInFinder: true);
}
