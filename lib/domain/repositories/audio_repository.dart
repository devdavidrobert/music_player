import '../entities/audio_file.dart';

abstract class AudioRepository {
  Future<List<AudioFile>> getAllSongs();
  Future<List<String>> getArtists();
  Future<List<String>> getAlbums();
  Future<List<AudioFile>> getSongsByArtist(String artist);
  Future<List<AudioFile>> getSongsByAlbum(String album);
  Future<List<AudioFile>> searchSongs(String query);
  Future<void> scanAndUpdateDatabase();
  Future<List<String>> getSelectedDirectories();
  Future<void> saveSelectedDirectories(List<String> directories);
  Future<void> startPlayback(List<AudioFile> queue, int index);
  Future<void> pausePlayback();
  Future<void> stopPlayback();
  Future<void> seekPlayback(Duration position);
}