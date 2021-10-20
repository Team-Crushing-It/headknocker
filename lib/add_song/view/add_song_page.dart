import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:headknocker/add_song/add_song.dart';

class AddSong extends StatelessWidget {
  const AddSong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 100,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {},
                ),
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
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: AddSongPage(),
      ),
    );
  }
}

class AddSongPage extends StatelessWidget {
  const AddSongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddSongCubit, AddSongState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Link Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 120,
              ),
              _LinkInput(),
              _AddSongButton(),
            ],
          ),
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
            errorText: state.link.invalid ? 'invalid link' : null,
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
        return state.status.isSubmissionInProgress
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
