import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:game_repository/src/models/models.dart';

import 'entities.dart';

class AlarmEntity extends Equatable {
  const AlarmEntity(this.songs);

  final List<SongEntity> songs;

  @override
  List<Object?> get props => [songs];

  Map<String, Object?> toJson() {
    return {
      'song': songs.map((songs) => songs.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'AlarmEntity {songs: $songs}';
  }

  static AlarmEntity fromSnapshot(DocumentSnapshot snap) {
    List<dynamic> songList =
        snap.get('songs').map((song) => SongEntity.fromJson(song)).toList();

    List<SongEntity> songs = songList.cast<SongEntity>();

    return AlarmEntity(songs);
  }
}
