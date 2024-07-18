import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_new_songs.dart';
import 'package:spotify/presentation/home/blog/news_song_state.dart';

import '../../../service_locator.dart';

class NewSongCubit extends Cubit<NewsSongState> {
  // super will whenever the cubit is initialized
  NewSongCubit() : super(NewSongLoading());

  Future<void> getNewSongs() async {
    final returnedSongs = await sl<GetNewSongUsecase>().call();
    returnedSongs.fold(
      (l) {
        return emit(NewSongLoadFailure());
      },
      (r) {
        return emit(NewSongLoaded(songs: r));
      },
    );
  }
}
