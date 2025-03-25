import '../../../../domain/entities/audio_file.dart';

abstract class AudioListState {}

class AudioListInitial extends AudioListState {}

class AudioListLoading extends AudioListState {}

class SongsLoaded extends AudioListState {
  final List<AudioFile> songs;
  SongsLoaded(this.songs);
}