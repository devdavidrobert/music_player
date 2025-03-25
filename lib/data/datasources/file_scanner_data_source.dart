import 'dart:io';
import 'package:path/path.dart' as path;

class FileScannerDataSource {
  Future<List<String>> scanDirectories(List<String> directories) async {
    List<String> audioFiles = [];
    for (String dirPath in directories) {
      Directory dir = Directory(dirPath);
      if (await dir.exists()) {
        await for (var entity in dir.list(recursive: true)) {
          if (entity is File && _isSupportedAudioFile(entity.path)) {
            audioFiles.add(entity.path);
          }
        }
      }
    }
    return audioFiles;
  }

  bool _isSupportedAudioFile(String filePath) {
    final ext = path.extension(filePath).toLowerCase();
    return ['.mp3', '.wav', '.aac'].contains(ext);
  }
}