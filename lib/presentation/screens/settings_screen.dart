import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/settings/settings_bloc.dart';
import '../blocs/settings/settings_event.dart';
import '../blocs/settings/settings_state.dart';
import '../widgets/directory_selector.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              DirectorySelector(),
              ElevatedButton(
                onPressed: () => context.read<SettingsBloc>().add(ScanDirectories()),
                child: Text('Rescan'),
              ),
              if (state is DirectoriesSelected)
                Text('Selected: ${state.directories.join(", ")}'),
            ],
          );
        },
      ),
    );
  }
}