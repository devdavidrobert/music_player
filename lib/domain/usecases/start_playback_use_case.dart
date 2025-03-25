import '../entities/audio_file.dart';
import '../repositories/audio_repository.dart';

class StartPlaybackUseCase {
  final AudioRepository repository;

  StartPlaybackUseCase(this.repository);

  Future<void> call(List<AudioFile> queue, int index) => repository.startPlayback(queue, index);
}