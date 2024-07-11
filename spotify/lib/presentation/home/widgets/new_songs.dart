import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/presentation/home/blog/news_song_cubit.dart';
import 'package:spotify/presentation/home/blog/news_song_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongCubit(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewSongCubit, NewsSongState>(
          builder: (context, state) {
            if (state is NewSongLoading) {
              return CircularProgressIndicator();
            }
            if (state is NewSongLoaded) {
              return ListView.separated(
                  itemBuilder: itemBuilder,
                  separatorBuilder: separatorBuilder,
                  itemCount: itemCount);
            }
          },
        ),
      ),
    );
  }
}
