import '../repositories/audio_repository.dart';

class GetSelectedDirectoriesUseCase {
  final AudioRepository repository;

  GetSelectedDirectoriesUseCase(this.repository);

  Future<List<String>> call() => repository.getSelectedDirectories();
}