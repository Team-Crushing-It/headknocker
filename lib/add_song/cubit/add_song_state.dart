part of 'add_song_cubit.dart';

class AddSongState extends Equatable {
  const AddSongState(
      {this.link = const Link.pure(),
      this.status = FormzStatus.pure,
      this.songs = const []});

  final Link link;
  final FormzStatus status;
  final List<Song> songs;

  @override
  List<Object> get props => [link, status, songs];

  AddSongState copyWith({
    Link? link,
    FormzStatus? status,
    List<Song>? songs,
  }) {
    return AddSongState(
      link: link ?? this.link,
      status: status ?? this.status,
      songs: songs ?? this.songs,
    );
  }
}
