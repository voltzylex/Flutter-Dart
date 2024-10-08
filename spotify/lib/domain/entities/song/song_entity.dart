import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String image;
  final bool isFavorite;
  final String songId;
  final String url;

  SongEntity(
    this.artist,
    this.duration,
    this.releaseDate,
    this.title,
    this.image,
    this.isFavorite,
    this.songId,
    this.url,
  );

  factory SongEntity.fromJson(Map<String, dynamic> data) {
    return SongEntity(data["artist"], data["duration"], data["releaseDate"],
        data["title"], data["image"], data["favorite"], data["id"],data["url"]);
    // title = data["title"];
    // artist = data["artist"];
    // duration = data["duration"];
    // releaseDate = data["releaseDate"];
  }
}
