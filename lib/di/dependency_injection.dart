import 'package:get_it/get_it.dart';
import '../data/datasources/file_scanner_data_source.dart';
import '../data/datasources/metadata_data_source.dart';
import '../data/datasources/audio_database_data_source.dart';
import '../data/datasources/selected_directories_data_source.dart';
import '../data/datasources/audio_player_data_source.dart';
import '../data/datasources/permission_service.dart';
import '../data/repositories/audio_repository_impl.dart';
import '../domain/usecases/get_selected_directories_use_case.dart';
import '../domain/usecases/save_selected_directories_use_case.dart';
import '../domain/usecases/scan_and_update_database_use_case.dart';
import '../domain/usecases/get_audio_files_use_case.dart';
import '../domain/usecases/get_artists_use_case.dart';
import '../domain/usecases/get_albums_use_case.dart';
import '../domain/usecases/get_songs_by_artist_use_case.dart';
import '../domain/usecases/get_songs_by_album_use_case.dart';
import '../domain/usecases/start_playback_use_case.dart';
import '../domain/usecases/pause_playback_use_case.dart';
import '../domain/usecases/stop_playback_use_case.dart';
import '../domain/usecases/seek_playback_use_case.dart';
import '../domain/usecases/search_audio_use_case.dart';
import '../presentation/blocs/settings/settings_bloc.dart';
import '../presentation/blocs/audio_list/audio_list_bloc.dart';
import '../presentation/blocs/audio_player/audio_player_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Data Sources
  getIt.registerLazySingleton(() => FileScannerDataSource());
  getIt.registerLazySingleton(() => MetadataDataSource());
  getIt.registerLazySingleton(() => AudioDatabaseDataSource());
  getIt.registerLazySingleton(() => SelectedDirectoriesDataSource());
  getIt.registerLazySingleton(() => AudioPlayerDataSource());
  getIt.registerLazySingleton(() => PermissionService());

  // Repositories
  getIt.registerLazySingleton(() => AudioRepositoryImpl(
        fileScanner: getIt(),
        metadata: getIt(),
        database: getIt(),
        directories: getIt(),
        player: getIt(),
      ));

  // Use Cases
  getIt.registerLazySingleton(() => GetSelectedDirectoriesUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveSelectedDirectoriesUseCase(getIt()));
  getIt.registerLazySingleton(() => ScanAndUpdateDatabaseUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAudioFilesUseCase(getIt()));
  getIt.registerLazySingleton(() => GetArtistsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAlbumsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSongsByArtistUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSongsByAlbumUseCase(getIt()));
  getIt.registerLazySingleton(() => StartPlaybackUseCase(getIt()));
  getIt.registerLazySingleton(() => PausePlaybackUseCase(getIt()));
  getIt.registerLazySingleton(() => StopPlaybackUseCase(getIt()));
  getIt.registerLazySingleton(() => SeekPlaybackUseCase(getIt()));
  getIt.registerLazySingleton(() => SearchAudioUseCase(getIt()));

  // Blocs
  getIt.registerFactory(() => SettingsBloc(
        getSelectedDirectories: getIt(),
        saveSelectedDirectories: getIt(),
        scanAndUpdateDatabase: getIt(),
      ));
  getIt.registerFactory(() => AudioListBloc(
        getAudioFiles: getIt(),
        searchAudio: getIt(),
      ));
  getIt.registerFactory(() => AudioPlayerBloc(
        startPlayback: getIt(),
        pausePlayback: getIt(),
        stopPlayback: getIt(),
        seekPlayback: getIt(),
        playerDataSource: getIt(),
      ));
}