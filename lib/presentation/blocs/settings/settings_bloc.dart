import 'package:flutter_bloc/flutter_bloc.dart';
import 'settings_event.dart';
import 'settings_state.dart';
import '../../../../domain/usecases/get_selected_directories_use_case.dart';
import '../../../../domain/usecases/save_selected_directories_use_case.dart';
import '../../../../domain/usecases/scan_and_update_database_use_case.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetSelectedDirectoriesUseCase getSelectedDirectories;
  final SaveSelectedDirectoriesUseCase saveSelectedDirectories;
  final ScanAndUpdateDatabaseUseCase scanAndUpdateDatabase;

  SettingsBloc({
    required this.getSelectedDirectories,
    required this.saveSelectedDirectories,
    required this.scanAndUpdateDatabase,
  }) : super(SettingsInitial()) {
    on<SelectDirectories>((event, emit) async {
      await saveSelectedDirectories(event.directories);
      emit(DirectoriesSelected(event.directories));
      await scanAndUpdateDatabase();
    });

    on<ScanDirectories>((event, emit) async {
      emit(SettingsLoading());
      await scanAndUpdateDatabase();
      final dirs = await getSelectedDirectories();
      emit(DirectoriesSelected(dirs));
    });
  }
}