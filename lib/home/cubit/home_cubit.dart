import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:songs_repository/songs_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required FirestoreSongsRepository repository})
      : _repository = repository,
        super(const HomeState.init());

  final FirestoreSongsRepository _repository;

  Future<void> checkId(String id) async {
    // First we check if the user has a
    final exists = await _repository.checkId(id);

    if (!exists) {
      await _repository.createCollection(
          id, const Song(title: 'No Song', url: 'url'));
    }

    await Future.delayed(const Duration(seconds: 3), () {});

    emit(const HomeState.loaded());
  }
}
