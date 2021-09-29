// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headknocker/home/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFC2351F),
        highlightColor: const Color(0xFFE7E7E7),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: GoogleFonts.arimo().fontFamily,
            color: const Color(0xFFE7E7E7),
            fontWeight: FontWeight.bold,
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
    );
  }
}
