import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song_service.dart';
import 'package:spotify/domain/repository/song/song_repo.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlaylist() async {
    return await sl<SongFirebaseService>().getPlaylist();
  }
}
