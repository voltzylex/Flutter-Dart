import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/common_functions.dart';
import 'package:spotify/core/configs/helpers/size_extension.dart';
import 'package:spotify/presentation/home/blog/news_song_cubit.dart';
import 'package:spotify/presentation/home/blog/news_song_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongCubit()..getNewSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewSongCubit, NewsSongState>(
          builder: (context, state) {
            if (state is NewSongLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is NewSongLoaded) {
              return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    debugLog("New Songs are ${state.songs[index].image}");
                    return SizedBox(
                      height: 160,
                      child: Column(
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(state.songs[index].image)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => 14.w,
                  itemCount: state.songs.length);
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
