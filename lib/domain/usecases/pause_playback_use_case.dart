import '../repositories/audio_repository.dart';

class PausePlaybackUseCase {
  final AudioRepository repository;

  PausePlaybackUseCase(this.repository);

  Future<void> call() => repository.pausePlayback();
}