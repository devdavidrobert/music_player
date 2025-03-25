import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/audio_list/audio_list_bloc.dart';
import '../blocs/audio_list/audio_list_event.dart';
import '../blocs/audio_player/audio_player_bloc.dart';
import '../blocs/audio_player/audio_player_event.dart';
import '../blocs/audio_player/audio_player_state.dart';
import '../widgets/audio_list_item.dart';
import '../widgets/mini_player.dart';

class AudioListScreen extends StatelessWidget {
  const AudioListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music Player')),
      body: Column(
        children: [
          TextField(
            onChanged: (query) => context.read<AudioListBloc>().add(SearchSongs(query)),
            decoration: InputDecoration(labelText: 'Search'),
          ),
          Expanded(
            child: BlocBuilder<AudioListBloc, AudioListState>(
              builder: (context, state) {
                if (state is AudioListLoading) return Center(child: CircularProgressIndicator());
                if (state is SongsLoaded) {
                  return ListView.builder(
                    itemCount: state.songs.length,
                    itemBuilder: (context, index) {
                      final song = state.songs[index];
                      return AudioListItem(
                        song: song,
                        onTap: () => context.read<AudioPlayerBloc>().add(StartPlayback(state.songs, index)),
                      );
                    },
                  );
                }
                return Center(child: Text('No songs found'));
              },
            ),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }
}