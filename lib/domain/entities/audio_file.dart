class AudioFile {
  final int? id;
  final String path;
  final String title;
  final String artist;
  final String album;
  final Duration duration;
  final String? albumArtPath;

  AudioFile({
    this.id,
    required this.path,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
    this.albumArtPath,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'path': path,
        'title': title,
        'artist': artist,
        'album': album,
        'duration': duration.inMilliseconds,
        'albumArtPath': albumArtPath,
      };

  factory AudioFile.fromMap(Map<String, dynamic> map) => AudioFile(
        id: map['id'],
        path: map['path'],
        title: map['title'],
        artist: map['artist'],
        album: map['album'],
        duration: Duration(milliseconds: map['duration']),
        albumArtPath: map['albumArtPath'],
      );
}