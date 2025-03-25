import '../entities/audio_file.dart';
import '../repositories/audio_repository.dart';

class GetSongsByAlbumUseCase {
  final AudioRepository repository;

  GetSongsByAlbumUseCase(this.repository);

  Future<List<AudioFile>> call(String album) => repository.getSongsByAlbum(album);
}