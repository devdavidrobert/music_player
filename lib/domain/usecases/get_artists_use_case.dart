import '../repositories/audio_repository.dart';

class GetArtistsUseCase {
  final AudioRepository repository;

  GetArtistsUseCase(this.repository);

  Future<List<String>> call() => repository.getArtists();
}