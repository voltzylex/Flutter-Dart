import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/repositories/song/song_repository_impl.dart';
import 'package:spotify/service_locator.dart';

class GetNewSongUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<SongRepositoryImpl>().getNewSongs();
  }
}
