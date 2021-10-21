import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:headknocker/add_song/add_song.dart';
import 'package:songs_repository/songs_repository.dart';

class AddSong extends StatelessWidget {
  const AddSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.add, color: Colors.black),
        onPressed: () {
          context.read<AddSongCubit>().addSong();
        },
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              const Expanded(
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              Expanded(
                child: Text(
                  'Back',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: _AddSongView(list: context.watch<AddSongCubit>().state.songs),
      ),
    );
  }
}

class _AddSongView extends StatelessWidget {
  const _AddSongView({Key? key, required this.list}) : super(key: key);

  final List<Song>? list;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddSongCubit, AddSongState>(
      listener: (context, state) {
        if (state.status!.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Link Failure')),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                'Current Alarm Song',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                list!.first.title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'Recents',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 24),
              ),
            ),
            if (list!.length == 1)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'no recents',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              )
            else
              ListView.builder(
                reverse: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: list!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    child: Text(
                      list![index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16),
                    ),
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}

class _CurrentAlarmSong extends StatelessWidget {
  const _CurrentAlarmSong({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Alarm Song',
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentsView extends StatelessWidget {
  const _RecentsView({Key? key, required this.list}) : super(key: key);

  final List<Song> list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recents',
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
            ),
            if (list.length == 1)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'no recents',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Text(
                      list[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16),
                    );
                  },
                ),
              )
          ],
        ),
      ),
    );
  }
}

class _LinkInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSongCubit, AddSongState>(
      buildWhen: (previous, current) => previous.link != current.link,
      builder: (context, state) {
        return TextField(
          key: const Key('addSongForm_linkInput_textField'),
          // onChanged: (email) => context.read<AddSongCubit>().emailChanged(email),
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            labelText: 'Youtube Link',
            helperText: '',
            errorText: state.link!.invalid ? 'invalid link' : null,
          ),
        );
      },
    );
  }
}

class _AddSongButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSongCubit, AddSongState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status!.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: const Color(0xFFFFD600),
                ),
                onPressed: () {},
                // onPressed: state.status.isValidated
                //     ? () => context.read<LoginCubit>().logInWithCredentials()
                //     : null,
                child: const Text('LOGIN'),
              );
      },
    );
  }
}
