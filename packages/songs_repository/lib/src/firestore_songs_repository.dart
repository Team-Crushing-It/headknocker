import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:songs_repository/songs_repository.dart';
import 'entities/entities.dart';
import 'package:cache/cache.dart';
import 'package:meta/meta.dart';

/// Thrown during check game if no game exists
class JoinGameFailure implements Exception {}

/// {@template firestore_game_repository}
/// Repository which manages the game in firestore.
/// {@endtemplate}
class FirestoreSongsRepository {
  /// {@macro authentication_repository}
  FirestoreSongsRepository({
    CacheClient? cache,
  }) : _cache = cache ?? CacheClient();

  final CacheClient _cache;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const gameCacheKey = '__game_cache_key__';

  final alarmsCollection = FirebaseFirestore.instance.collection('alarms');

  Future<List<Song>> fetchSongs(String id) async {
    return FirebaseFirestore.instance.collection(id).get().then((snapshot) {
      return snapshot.docs
          .map((doc) => Song.fromEntity(SongEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  Future<void> addSong(String url, String id) async {
    //TODO: scrape actual title

    Song output = Song(title: 'title', url: url);

    FirebaseFirestore.instance.collection(id).add(
          output.toEntity().toJson(Timestamp.now().toString()),
        );
  }
}
