import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song_entity.dart';
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
        width: 100,
        child: BlocBuilder<NewSongCubit, NewsSongState>(
          builder: (context, state) {
            if (state is NewSongLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }
            if (state is NewSongLoaded) {
              return _songs(state.songs);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //    builder: (BuildContext context)
              //   => SongPlayerPage(
              //     songEntity: songs[index],
              //   )
              // )
              // );
            },
            child: SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(songs.elementAt(index).image))),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          transform: Matrix4.translationValues(10, 10, 0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.isDarkMode
                                  ? AppColors.darkGrey
                                  : const Color(0xffE6E6E6)),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            color: context.isDarkMode
                                ? const Color(0xff959595)
                                : const Color(0xff555555),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    songs[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    songs[index].artist,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 14,
            ),
        itemCount: songs.length);
  }
}
