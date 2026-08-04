import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class FileStorageService {
  FileStorageService({this.testDirectory});

  final Directory? testDirectory;

  Future<Directory> get _audioDir async {
    if (testDirectory != null) {
      final dir = Directory(p.join(testDirectory!.path, 'audio'));
      if (!dir.existsSync()) {
        await dir.create(recursive: true);
      }
      return dir;
    }
    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(docs.path, 'audio'));
    if (!dir.existsSync()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<String> get audioDirectoryPath async => (await _audioDir).path;

  Future<String> generateAudioFilePath(String fileName) async {
    final dir = await _audioDir;
    return p.join(dir.path, fileName);
  }

  Future<String> computeSha256Hash(String filePath) async {
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<String> storeFile({
    required String sourcePath,
    required String fileName,
  }) async {
    final targetPath = await generateAudioFilePath(fileName);
    final source = File(sourcePath);
    final target = File(targetPath);

    if (await target.exists()) {
      await target.delete();
    }

    await source.rename(targetPath);
    return targetPath;
  }

  Future<String> getRelativePath(String absolutePath) async {
    final dirPath = await audioDirectoryPath;
    return p.relative(absolutePath, from: dirPath);
  }

  Future<String> getAbsolutePath(String relativePath) async {
    final dirPath = await audioDirectoryPath;
    return p.join(dirPath, relativePath);
  }

  Future<bool> fileExists(String relativePath) async {
    final absolute = await getAbsolutePath(relativePath);
    return File(absolute).existsSync();
  }

  Future<void> deleteFile(String relativePath) async {
    final absolute = await getAbsolutePath(relativePath);
    final file = File(absolute);
    if (file.existsSync()) {
      await file.delete();
    }
  }

  Future<int> fileSizeBytes(String relativePath) async {
    final absolute = await getAbsolutePath(relativePath);
    final file = File(absolute);
    if (!file.existsSync()) return 0;
    return file.length();
  }
}
