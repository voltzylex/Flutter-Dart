import '../../../domain/entities/song/song_entity.dart';

abstract class NewsSongState {}

class NewSongLoading extends NewsSongState {}

class NewSongLoaded extends NewsSongState {
  final List<SongEntity> songs;

  NewSongLoaded({required this.songs});
}

class NewSongLoadFailure extends NewsSongState {}
