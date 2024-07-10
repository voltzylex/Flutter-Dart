import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;

  SongEntity(
    this.artist,
    this.duration,
    this.releaseDate,
    this.title,
  );
  factory SongEntity.fromJson(Map<String, dynamic> data) {
    return SongEntity(
        data["artist"], data["duration"], data["releaseDate"], data["title"]);
    // title = data["title"];
    // artist = data["artist"];
    // duration = data["duration"];
    // releaseDate = data["releaseDate"];
  }
}
