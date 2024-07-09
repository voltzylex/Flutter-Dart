import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;

  SongModel(this.artist, this.duration, this.releaseDate, this.title);

  SongModel.fromJon(Map<String, dynamic> data) {
    title = data["title"];
    artist = data["artist"];
    duration = data["duration"];
    releaseDate = data["releaseDate"];
  }
}
