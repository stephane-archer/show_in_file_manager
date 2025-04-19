import 'package:flutter/material.dart';
import 'package:show_in_file_manager/show_in_file_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FileManagerDemo(),
    );
  }
}

class FileManagerDemo extends StatelessWidget {
  const FileManagerDemo({super.key});

  final List<String> demoFilePaths = const [
    'test_data/a.txt',
    'test_data/dir',
    'test_data/dir with space/file with space.txt',
    'test_data/dir with space/',
    'test_data/does_not_exist',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Show In File Manager Demo')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoFilePaths.length,
        itemBuilder: (context, index) {
          final path = demoFilePaths[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(path),
              trailing: IconButton(
                icon: const Icon(Icons.folder_open),
                onPressed: () async {
                  try {
                    await showInFileManager(path);
                  } catch (e) {
                    if (!context.mounted) {
                      throw StateError("Context unmounted");
                    }
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Error: $e')));
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
