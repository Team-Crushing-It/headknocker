import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:songs_repository/songs_repository.dart';

part 'add_song_state.dart';

class AddSongCubit extends Cubit<AddSongState> {
  AddSongCubit(
      {required FirestoreSongsRepository repository, required String id})
      : _repository = repository,
        _id = id,
        super(const AddSongState.init());

  final FirestoreSongsRepository _repository;
  final String _id;
  late final StreamSubscription _firestoreSubscription;

  void streamSongs() {
    _firestoreSubscription = _repository.songs(_id).listen(
          (songStream) => {
            print('streaming'),
            emit(AddSongState.update(songStream)),
          },
        );
  }

  Future<void> checkId() async {
    final exists = await _repository.checkId(_id);

    if (exists) {
      streamSongs();

      emit(const AddSongState.collectionExists());
    }
  }

  Future<void> addSong(String input) async {
    final output = Song(title: input, url: input);

    await _repository.addDocument(_id, output.toEntity().toJson());

    if (state.cStatus == CollectionStatus.firstTime) {
      emit(const AddSongState.collectionExists());
      await checkId();
    }
  }

  void linkChanged(String value) {
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
