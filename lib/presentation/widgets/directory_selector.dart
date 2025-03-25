import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import '../blocs/settings/settings_bloc.dart';
import '../blocs/settings/settings_event.dart';

class DirectorySelector extends StatelessWidget {
  const DirectorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final result = await FilePicker.platform.getDirectoryPath();
        if (result != null) {
          context.read<SettingsBloc>().add(SelectDirectories([result]));
        }
      },
      child: Text('Select Directory'),
    );
  }
}