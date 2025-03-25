import '../entities/audio_file.dart';
import '../repositories/audio_repository.dart';

class GetAudioFilesUseCase {
  final AudioRepository repository;

  GetAudioFilesUseCase(this.repository);

  Future<List<AudioFile>> call() => repository.getAllSongs();
}