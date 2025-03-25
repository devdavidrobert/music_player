import 'package:just_audio/just_audio.dart';
import '../../domain/entities/audio_file.dart';

class AudioPlayerDataSource {
  final AudioPlayer _player = AudioPlayer();

  Future<void> setQueue(List<AudioFile> queue) async {
    final playlist = ConcatenatingAudioSource(
      children: queue.map((song) => AudioSource.file(song.path)).toList(),
    );
    await _player.setAudioSource(playlist);
  }

  Future<void> play(int index) async {
    await _player.seek(Duration.zero, index: index);
    await _player.play();
  }

  Future<void> pause() async => await _player.pause();
  Future<void> stop() async => await _player.stop();
  Future<void> seek(Duration position) async => await _player.seek(position);
  Stream<Duration?> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;
  Stream<bool> get playingStream => _player.playingStream;
}