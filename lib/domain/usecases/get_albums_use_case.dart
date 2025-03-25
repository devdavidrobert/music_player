import '../repositories/audio_repository.dart';

class GetAlbumsUseCase {
  final AudioRepository repository;

  GetAlbumsUseCase(this.repository);

  Future<List<String>> call() => repository.getAlbums();
}