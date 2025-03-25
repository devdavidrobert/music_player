import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/get_audio_files_use_case.dart';
import '../../../../domain/usecases/search_audio_use_case.dart';
import 'audio_player_event.dart';
import 'audio_player_state.dart';

class AudioListBloc extends Bloc<AudioListEvent, AudioListState> {
  final GetAudioFilesUseCase getAudioFiles;
  final SearchAudioUseCase searchAudio;

  AudioListBloc({
    required this.getAudioFiles,
    required this.searchAudio,
  }) : super(AudioListInitial()) {
    on<LoadSongs>((event, emit) async {
      emit(AudioListLoading());
      final songs = await getAudioFiles();
      emit(SongsLoaded(songs));
    });

    on<SearchSongs>((event, emit) async {
      emit(AudioListLoading());
      final songs = await searchAudio(event.query);
      emit(SongsLoaded(songs));
    });
  }
}