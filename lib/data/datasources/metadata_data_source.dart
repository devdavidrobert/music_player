import 'dart:io';
import 'dart:ui';
import 'package:dart_tags/dart_tags.dart';

class MetadataDataSource {
  final TagProcessor _tagProcessor = TagProcessor();

  Future<Map<String, dynamic>> extractMetadata(String filePath) async {
    try {
      final file = File(filePath);
      final tags = await _tagProcessor.getTagsFromByteArray(file.readAsBytes());
      final tag = tags.isNotEmpty ? tags.first : null;

      // Extract metadata from the tag's 'tags' map
      final title = tag?.tags['title'] as String? ?? filePath.split('/').last;
      final artist = tag?.tags['artist'] as String? ?? 'Unknown Artist';
      final album = tag?.tags['album'] as String? ?? 'Unknown Album';

      // Handle album art (pictures)
      final pictures = tag?.tags['pictures'] as List<Picture>?;
      final albumArt =
          pictures != null && pictures.isNotEmpty
              ? pictures.first.picture
              : null;

      return {
        'title': title,
        'artist': artist,
        'album': album,
        'albumArt': albumArt,
      };
    } catch (e) {
      return {
        'title': filePath.split('/').last,
        'artist': 'Unknown Artist',
        'album': 'Unknown Album',
        'albumArt': null,
      };
    }
  }
}

extension on Picture {
  get picture => null;
}
