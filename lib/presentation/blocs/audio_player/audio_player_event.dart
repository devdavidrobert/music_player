abstract class AudioListEvent {}

class LoadSongs extends AudioListEvent {}

class SearchSongs extends AudioListEvent {
  final String query;
  SearchSongs(this.query);
}