import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:headknocker/add_song/add_song.dart';
import 'package:songs_repository/songs_repository.dart';

class AddSongPage extends StatelessWidget {
  const AddSongPage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: AddSongPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => AddSongCubit(context.read<FirestoreSongsRepository>()),
          child: const AddSongForm(),
        ),
      ),
    );
  }
}
