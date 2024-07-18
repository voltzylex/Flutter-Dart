import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/common/helpers/common_functions.dart';
import 'package:spotify/data/models/song/song_model.dart';
import 'package:spotify/domain/entities/song/song_entity.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlaylist();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      final data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("artist", descending: false)
          .limit(5)
          .get();
      // songs.addAll(data.docs.map(
      //   (e) => SongEntity.fromJson(e.data()),
      // ));

      for (var elements in data.docs) {
        var songModel = SongModel.fromJson(elements.data());
        // debugLog("New Song data ${elements.data()}", isLog: true);
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      debugLog(
        "Song service Catch $e",
      );
      return const Left("An Error Occured, Please try again");
    }
  }

  @override
  Future<Either> getPlaylist() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        // bool isFavorite = await sl<IsFavoriteSongUseCase>()
        //     .call(params: element.reference.id);
        // songModel.isFavorite = isFavorite;
        // songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }

      return Right(songs);
    } catch (e) {
      print(e);
      return const Left('An error occurred, Please try again.');
    }
  }
}
