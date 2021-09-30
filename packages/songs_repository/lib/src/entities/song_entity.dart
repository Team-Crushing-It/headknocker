import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:game_repository/src/models/models.dart';

class SongEntity extends Equatable {
  const SongEntity(this.artist, this.song);

  final String artist;
  final String song;

  @override
  List<Object?> get props => [artist, song];

  Map<String, Object?> toJson() {
    return {
      'artist': artist,
      'song': song,
    };
  }

  @override
  String toString() {
    return 'SongEntity {artist: $artist}';
  }

  static SongEntity fromJson(Map<String, Object?> json) {
    return SongEntity(
      json['artist'] as String,
      json['song'] as String,
    );
  }

  static SongEntity fromSnapshot(DocumentSnapshot snap) {
    return SongEntity(snap.get('artist'), snap.get('song'));
  }
}
