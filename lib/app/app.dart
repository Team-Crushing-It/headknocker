// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headknocker/app/bloc/app_bloc.dart';
import 'package:headknocker/home/cubit/home_cubit.dart';
import 'package:headknocker/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:songs_repository/songs_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required FirestoreSongsRepository songsRepository,
  })  : _authenticationRepository = authenticationRepository,
        _songsRepository = songsRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final FirestoreSongsRepository _songsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _songsRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBloc(
              authenticationRepository:
                  context.read<AuthenticationRepository>(),
            ),
          ),
          BlocProvider<HomeCubit>(
            lazy: true,
            create: (context) => HomeCubit(
              repository: context.read<FirestoreSongsRepository>(),
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.authenticated) {
          context
              .read<HomeCubit>()
              .checkId(context.read<AppBloc>().state.user.id);
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF000000),
          highlightColor: const Color(0xFFE7E7E7),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: GoogleFonts.archivoBlack().fontFamily,
              color: const Color(0xFFE7E7E7),
              fontSize: 20,
            ),
            headline2: TextStyle(
              fontFamily: GoogleFonts.arimo().fontFamily,
              color: const Color(0xFF9E9E9E),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        home: const Home(),
      ),
    );
  }
}
