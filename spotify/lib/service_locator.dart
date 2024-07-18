import 'package:get_it/get_it.dart';
import 'package:spotify/data/repositories/auth/auth_repository_impl.dart';
import 'package:spotify/data/repositories/song/song_repository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/song/song_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song_repo.dart';
import 'package:spotify/domain/usecases/auth/signin_usecase.dart';
import 'package:spotify/domain/usecases/auth/signup_usecase.dart';
import 'package:spotify/domain/usecases/song/get_playlist.dart';

import 'domain/usecases/song/get_new_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // registerSigleton will create only 1 instance
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );
  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl(),
  );
// Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl(),
  );
// Usercases
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
  sl.registerSingleton<SigninUsecase>(
    SigninUsecase(),
  );
  sl.registerSingleton<GetNewSongUsecase>(
    GetNewSongUsecase(),
  );
  sl.registerSingleton<GetPlayListUsercase>(
    GetPlayListUsercase(),
  );
}
