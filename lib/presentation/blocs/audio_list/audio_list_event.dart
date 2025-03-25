import '../../../../domain/entities/audio_file.dart';

abstract class AudioPlayerEvent {}

class StartPlayback extends AudioPlayerEvent {
  final List<AudioFile> queue;
  final int index;
  StartPlayback(this.queue, this.index);
}

class PausePlayback extends AudioPlayerEvent {}

class StopPlayback extends AudioPlayerEvent {}

class SeekPlayback extends AudioPlayerEvent {
  final Duration position;
  SeekPlayback(this.position);
}