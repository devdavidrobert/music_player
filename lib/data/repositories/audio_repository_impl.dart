import '../datasources/file_scanner_data_source.dart';
import '../datasources/metadata_data_source.dart';
import '../datasources/audio_database_data_source.dart';
import '../datasources/selected_directories_data_source.dart';
import '../datasources/audio_player_data_source.dart';
import '../../domain/entities/audio_file.dart';
import '../../domain/repositories/audio_repository.dart';

class AudioRepositoryImpl implements AudioRepository {
  final FileScannerDataSource fileScanner;
  final MetadataDataSource metadata;
  final AudioDatabaseDataSource database;
  final SelectedDirectoriesDataSource directories;
  final AudioPlayerDataSource player;

  AudioRepositoryImpl({
    required this.fileScanner,
    required this.metadata,
    required this.database,
    required this.directories,
    required this.player,
  });

  @override
  Future<List<AudioFile>> getAllSongs() => database.getAllSongs();

  @override
  Future<List<String>> getArtists() => database.getArtists();

  @override
  Future<List<String>> getAlbums() => database.getAlbums();

  @override
  Future<List<AudioFile>> getSongsByArtist(String artist) => database.getSongsByArtist(artist);

  @override
  Future<List<AudioFile>> getSongsByAlbum(String album) => database.getSongsByAlbum(album);

  @override
  Future<List<AudioFile>> searchSongs(String query) => database.searchSongs(query);

  @override
  Future<void> scanAndUpdateDatabase() async {
    final dirs = await directories.getSelectedDirectories();
    final files = await fileScanner.scanDirectories(dirs);
    for (var file in files) {
      final meta = await metadata.extractMetadata(file);
      final song = AudioFile(
        path: file,
        title: meta['title'],
        artist: meta['artist'],
        album: meta['album'],
        duration: Duration.zero, // Placeholder; update with real duration if needed
        albumArtPath: null, // Implement album art caching if desired
      );
      await database.upsertSong(song);
    }
  }

  @override
  Future<List<String>> getSelectedDirectories() => directories.getSelectedDirectories();

  @override
  Future<void> saveSelectedDirectories(List<String> dirs) => directories.saveSelectedDirectories(dirs);

  @override
  Future<void> startPlayback(List<AudioFile> queue, int index) => player.play(index);

  @override
  Future<void> pausePlayback() => player.pause();

  @override
  Future<void> stopPlayback() => player.stop();

  @override
  Future<void> seekPlayback(Duration position) => player.seek(position);
}