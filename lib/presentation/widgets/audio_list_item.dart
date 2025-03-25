import 'package:flutter/material.dart';
import '../../domain/entities/audio_file.dart';

class AudioListItem extends StatelessWidget {
  final AudioFile song;
  final VoidCallback onTap;

  const AudioListItem({super.key, required this.song, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(song.title),
      subtitle: Text(song.artist),
      onTap: onTap,
    );
  }
}