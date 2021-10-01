import 'package:equatable/equatable.dart';
import 'package:game_repository/songs_repository.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Song extends Equatable {
  const Song({
    required this.artist,
    required this.song,
  });

  final String artist;
  final String song;

  @override
  List<Object> get props => [artist, song];

  Song copyWith({
    required List<String> songData,
  }) {
    return Song(
      artist: artist,
      song: song,
    );
  }

  @override
  String toString() {
    return 'Song{artist: $artist}';
  }

  SongEntity toEntity() {
    return SongEntity(artist, song);
  }

  static Song fromEntity(SongEntity entity) {
    return Song(
      artist: entity.artist,
      song: entity.song,
    );
  }
}
