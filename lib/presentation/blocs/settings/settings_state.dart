abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class DirectoriesSelected extends SettingsState {
  final List<String> directories;
  DirectoriesSelected(this.directories);
}