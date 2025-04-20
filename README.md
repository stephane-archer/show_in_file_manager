# show_in_file_manager

A Flutter package to open the system's file manager and highlight a specific file or directory.  
Supports **Windows** and **macOS**. Contributions are welcome to expand support to other platforms.

## Features

- Open the native file manager (e.g., Finder on macOS, Explorer on Windows)
- Highlight a specific file or open a directory
- Simple and intuitive API

## Platform Support

- **Windows**: ✅ Supported
- **macOS**: ✅ Supported
- **Linux**: 🔧 In progress / Community contributions welcome
- **Android**: 🔧 In progress / Community contributions welcome
- **iOS**: 🔧 In progress / Community contributions welcome

## Installation

Add the dependency using one of the following methods:

**Option 1: Add manually to `pubspec.yaml`**

```yaml
show_in_file_manager: ^<latest_version>
```

Then run:

```bash
flutter pub get
```

**Option 2: Use the Flutter CLI**

```bash
flutter pub add show_in_file_manager
```

## Usage

```Dart
void main() async {
  const filePath = '/Users/yourname/Documents/example.txt';
  await showInFileManager(filePath);
}
```

## Contributions

Currently supports Windows and macOS.  
If you're interested in adding support for Linux, Android, or iOS, please open a pull request or issue—contributions are very welcome!