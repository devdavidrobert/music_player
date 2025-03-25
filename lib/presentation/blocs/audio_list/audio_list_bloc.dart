import 'package:flutter_bloc/flutter_bloc.dart';
import 'audio_list_event.dart';
import 'audio_list_state.dart';
import '../../../../domain/usecases/start_playback_use_case.dart';
import '../../../../domain/usecases/pause_playback_use_case.dart';
import '../../../../domain/usecases/stop_playback_use_case.dart';
import '../../../../domain/usecases/seek_playback_use_case.dart';
import '../../../../data/datasources/audio_player_data_source.dart';

class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  final StartPlaybackUseCase startPlayback;
  final PausePlaybackUseCase pausePlayback;
  final StopPlaybackUseCase stopPlayback;
  final SeekPlaybackUseCase seekPlayback;
  final AudioPlayerDataSource playerDataSource;

  AudioPlayerBloc({
    required this.startPlayback,
    required this.pausePlayback,
    required this.stopPlayback,
    required this.seekPlayback,
    required this.playerDataSource,
  }) : super(AudioPlayerState(
          currentSong: null,
          isPlaying: false,
          position: Duration.zero,
          duration: Duration.zero,
          queue: [],
          currentIndex: 0,
        )) {
    on<StartPlayback>((event, emit) async {
      await startPlayback(event.queue, event.index);
      emit(state.copyWith(
        currentSong: event.queue[event.index],
        isPlaying: true,
        queue: event.queue,
        currentIndex: event.index,
      ));
      _listenToPlayerStreams(emit);
    });

    on<PausePlayback>((event, emit) async {
      await pausePlayback();
      emit(state.copyWith(isPlaying: false));
    });

    on<StopPlayback>((event, emit) async {
      await stopPlayback();
      emit(state.copyWith(isPlaying: false, position: Duration.zero));
    });

    on<SeekPlayback>((event, emit) async {
      await seekPlayback(event.position);
      emit(state.copyWith(position: event.position));
    });
  }

  void _listenToPlayerStreams(Emitter<AudioPlayerState> emit) {
    playerDataSource.positionStream.listen((position) {
      if (position != null) emit(state.copyWith(position: position));
    });
    playerDataSource.durationStream.listen((duration) {
      if (duration != null) emit(state.copyWith(duration: duration));
    });
    playerDataSource.playingStream.listen((isPlaying) {
      emit(state.copyWith(isPlaying: isPlaying));
    });
  }
}