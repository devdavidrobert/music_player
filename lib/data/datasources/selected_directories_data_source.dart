import 'package:shared_preferences/shared_preferences.dart';

class SelectedDirectoriesDataSource {
  static const _key = 'selected_directories';

  Future<List<String>> getSelectedDirectories() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> saveSelectedDirectories(List<String> directories) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, directories);
  }
}