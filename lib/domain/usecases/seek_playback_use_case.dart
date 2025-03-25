import '../repositories/audio_repository.dart';

class SeekPlaybackUseCase {
  final AudioRepository repository;

  SeekPlaybackUseCase(this.repository);

  Future<void> call(Duration position) => repository.seekPlayback(position);
}