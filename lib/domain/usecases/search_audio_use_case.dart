import '../entities/audio_file.dart';
import '../repositories/audio_repository.dart';

class SearchAudioUseCase {
  final AudioRepository repository;

  SearchAudioUseCase(this.repository);

  Future<List<AudioFile>> call(String query) => repository.searchSongs(query);
}