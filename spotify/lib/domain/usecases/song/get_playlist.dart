import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/song/song_repo.dart';
import 'package:spotify/service_locator.dart';

class GetPlayListUsercase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    return await sl<SongsRepository>().getPlaylist();
  }
}
