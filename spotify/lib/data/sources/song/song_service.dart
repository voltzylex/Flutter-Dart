import 'package:dartz/dartz.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() {
    // TODO: implement getNewSongs
    throw UnimplementedError();
  }
}
