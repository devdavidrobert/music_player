import '../entities/audio_file.dart';
import '../repositories/audio_repository.dart';

class GetSongsByArtistUseCase {
  final AudioRepository repository;

  GetSongsByArtistUseCase(this.repository);

  Future<List<AudioFile>> call(String artist) => repository.getSongsByArtist(artist);
}