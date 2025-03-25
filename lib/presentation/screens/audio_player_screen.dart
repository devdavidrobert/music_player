import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/audio_list/audio_list_bloc.dart';
import '../blocs/audio_list/audio_list_event.dart';
import '../blocs/audio_list/audio_list_state.dart';
import '../widgets/player_controls.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Now Playing')),
      body: BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
        builder: (context, state) {
          if (state.currentSong == null) return Center(child: Text('No song selected'));
          return Column(
            children: [
              Text(state.currentSong!.title),
              Text(state.currentSong!.artist),
              PlayerControls(),
              Slider(
                value: state.position.inSeconds.toDouble(),
                max: state.duration.inSeconds.toDouble(),
                onChanged: (value) => context.read<AudioPlayerBloc>().add(SeekPlayback(Duration(seconds: value.toInt()))),
              ),
            ],
          );
        },
      ),
    );
  }
}