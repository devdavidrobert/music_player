import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/dependency_injection.dart';
import 'presentation/blocs/audio_player/audio_player_event.dart';
import 'presentation/screens/audio_list_screen.dart';
import 'presentation/blocs/settings/settings_bloc.dart';
import 'presentation/blocs/audio_list/audio_list_bloc.dart';
import 'presentation/blocs/audio_player/audio_player_bloc.dart';

void main() {
  setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SettingsBloc>()),
        BlocProvider(create: (_) => getIt<AudioListBloc>()..add(LoadSongs())),
        BlocProvider(create: (_) => getIt<AudioPlayerBloc>()),
      ],
      child: MaterialApp(
        title: 'Music Player',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: AudioListScreen(),
      ),
    );
  }
}