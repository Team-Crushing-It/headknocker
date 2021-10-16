import 'package:songs_repository/songs_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_song_state.dart';

class AddSongCubit extends Cubit<AddSongState> {
  AddSongCubit(this._songsRepository) : super(const AddSongState());

  final FirestoreSongsRepository _songsRepository;

  void emailChanged(String value) {
    final link = Link.dirty(value);
    emit(state.copyWith(
      link: link,
      status: Formz.validate([link]),
    ));
  }

  //TODO: AddSong
  //TODO: FetchSongs
}
