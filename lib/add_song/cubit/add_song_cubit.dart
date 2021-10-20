import 'dart:async';

import 'package:songs_repository/songs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_song_state.dart';

class AddSongCubit extends Cubit<AddSongState> {
  AddSongCubit(
      {required FirestoreSongsRepository repository, required String id})
      : _repository = repository,
        _id = id,
        super(const AddSongState()) {
    streamSongs();
  }

  final FirestoreSongsRepository _repository;
  final String _id;
  late final StreamSubscription _firestoreSubscription;

  void streamSongs() {
    _firestoreSubscription = _repository.songs(_id).listen(
          (songStream) => {
            print('streaming'),
            emit(state.copyWith(songs: songStream)),
          },
        );
  }

  void addSong() {
    const output = Song(title: 'title', url: '');

    _repository.addDocument(_id, output.toEntity().toJson());
  }

  void emailChanged(String value) {
    final link = Link.dirty(value);
    emit(state.copyWith(
      link: link,
      status: Formz.validate([link]),
    ));
  }

  @override
  Future<void> close() {
    _firestoreSubscription.cancel();

    // _gameRepository.removeUser(state.userId, state.game);

    return super.close();
  }
}
