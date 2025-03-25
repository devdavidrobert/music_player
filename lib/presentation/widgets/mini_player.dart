import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/audio_list/audio_list_bloc.dart';
import '../blocs/audio_list/audio_list_state.dart';
import 'player_controls.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerBloc, AudioPlayerState>(
      builder: (context, state) {
        if (state.currentSong == null) return SizedBox.shrink();
        return Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(child: Text(state.currentSong!.title)),
              PlayerControls(),
            ],
          ),
        );
      },
    );
  }
}