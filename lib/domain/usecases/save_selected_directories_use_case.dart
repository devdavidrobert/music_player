import '../repositories/audio_repository.dart';

class SaveSelectedDirectoriesUseCase {
  final AudioRepository repository;

  SaveSelectedDirectoriesUseCase(this.repository);

  Future<void> call(List<String> directories) => repository.saveSelectedDirectories(directories);
}