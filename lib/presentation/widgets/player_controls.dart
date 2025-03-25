import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/audio_list/audio_list_bloc.dart';
import '../blocs/audio_list/audio_list_event.dart';
import '../blocs/audio_list/audio_list_state.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(state.isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () => state.isPlaying
                  ? context.read<AudioPlayerBloc>().add(PausePlayback())
                  : context.read<AudioPlayerBloc>().add(StartPlayback(state.queue, state.currentIndex)),
            ),
            IconButton(
              icon: Icon(Icons.stop),
              onPressed: () => context.read<AudioPlayerBloc>().add(StopPlayback()),
            ),
          ],
        );
      },
    );
  }
}