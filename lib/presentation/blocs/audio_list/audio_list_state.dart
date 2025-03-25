import '../../../../domain/entities/audio_file.dart';

class AudioPlayerState {
  final AudioFile? currentSong;
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final List<AudioFile> queue;
  final int currentIndex;

  AudioPlayerState({
    required this.currentSong,
    required this.isPlaying,
    required this.position,
    required this.duration,
    required this.queue,
    required this.currentIndex,
  });

  AudioPlayerState copyWith({
    AudioFile? currentSong,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    List<AudioFile>? queue,
    int? currentIndex,
  }) {
    return AudioPlayerState(
      currentSong: currentSong ?? this.currentSong,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      queue: queue ?? this.queue,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}