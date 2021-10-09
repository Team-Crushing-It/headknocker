part of 'add_song_cubit.dart';

class AddSongState extends Equatable {
  const AddSongState({
    this.link = const Link.pure(),
    this.status = FormzStatus.pure,
  });

  final Link link;
  final FormzStatus status;

  @override
  List<Object> get props => [link, status];

  AddSongState copyWith({
    Link? link,
    FormzStatus? status,
  }) {
    return AddSongState(
      link: link ?? this.link,
      status: status ?? this.status,
    );
  }
}
