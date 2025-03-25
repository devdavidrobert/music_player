abstract class SettingsEvent {}

class SelectDirectories extends SettingsEvent {
  final List<String> directories;
  SelectDirectories(this.directories);
}

class ScanDirectories extends SettingsEvent {}