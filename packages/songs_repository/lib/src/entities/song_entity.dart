import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:songs_repository/src/models/models.dart';

class SongEntity extends Equatable {
  const SongEntity(this.title, this.url);

  final String title;
  final String url;

  @override
  List<Object?> get props => [title, url];

  Map<String, Object?> toJson(String timeStamp) {
    return {
      'title': title,
      'url': url,
      'createdAt': timeStamp,
    };
  }

  @override
  String toString() {
    return 'SongEntity {title: $title}';
  }

  static SongEntity fromJson(Map<String, Object?> json) {
    return SongEntity(
      json['title'] as String,
      json['url'] as String,
    );
  }

  static SongEntity fromSnapshot(DocumentSnapshot snap) {
    return SongEntity(snap.get('title'), snap.get('url'));
  }
}
