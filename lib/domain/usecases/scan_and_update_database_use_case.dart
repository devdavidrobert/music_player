import '../repositories/audio_repository.dart';

class ScanAndUpdateDatabaseUseCase {
  final AudioRepository repository;

  ScanAndUpdateDatabaseUseCase(this.repository);

  Future<void> call() => repository.scanAndUpdateDatabase();
}