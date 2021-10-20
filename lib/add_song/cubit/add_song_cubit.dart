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
    fetchSongs(id);
  }

  final FirestoreSongsRepository _repository;
  final String _id;

  void emailChanged(String value) {
    final link = Link.dirty(value);
    emit(state.copyWith(
      link: link,
      status: Formz.validate([link]),
    ));
  }

  Future<void> fetchSongs(String id) async {
    print('fetch songs');
    final output = await _repository.fetchSongs(id);

    emit(state.copyWith(songs: output));
  }
}
