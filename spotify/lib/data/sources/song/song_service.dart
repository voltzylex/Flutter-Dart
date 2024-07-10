import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song/song_model.dart';
import 'package:spotify/domain/entities/song/song_entity.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      final data = await FirebaseFirestore.instance
          .collection("Songs")
          .orderBy("releaseDate", descending: true)
          .limit(3)
          .get();
      // songs.addAll(data.docs.map(
      //   (e) => SongEntity.fromJson(e.data()),
      // ));
      for (var elements in data.docs) {
        var songModel = SongModel.fromJon(elements.data());
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } catch (e) {
      return const Left("An Error Occured, Please try again");
    }
  }
}
