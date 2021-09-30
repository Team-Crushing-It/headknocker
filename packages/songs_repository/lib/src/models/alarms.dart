import 'package:equatable/equatable.dart';
import 'package:game_repository/songs_repository.dart';
import 'package:game_repository/src/entities/alarm_entity.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Alarm extends Equatable {
  const Alarm({
    required this.songs,
  });

  final List<Song> songs;

  @override
  List<Object> get props => [songs];

  Alarm copyWith({
    required List<Song> songs,
  }) {
    return Alarm(songs: songs);
  }

  @override
  String toString() {
    return 'Alarm{songs: $songs}';
  }

  AlarmEntity toEntity() {
    return AlarmEntity(
      songs.map((song) => song.toEntity()).toList(),
    );
  }

  static Alarm fromEntity(AlarmEntity entity) {
    return Alarm(
      songs: entity.songs.map((song) => Song.fromEntity(song)).toList(),
    );
  }
}
