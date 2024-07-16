import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song_entity.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  String? image;

  SongModel(
      this.artist, this.duration, this.releaseDate, this.title, this.image);

  SongModel.fromJon(Map<String, dynamic> data) {
    title = data["title"];
    artist = data["artist"];
    duration = data["duration"];
    releaseDate = data["releaseDate"];
    image = data["image"];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(artist!, duration!, releaseDate!, title!, image!);
  }
}
