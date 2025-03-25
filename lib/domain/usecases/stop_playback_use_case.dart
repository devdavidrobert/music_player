import '../repositories/audio_repository.dart';

class StopPlaybackUseCase {
  final AudioRepository repository;

  StopPlaybackUseCase(this.repository);

  Future<void> call() => repository.stopPlayback();
}