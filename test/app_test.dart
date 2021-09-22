// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:l2t_beta/app/app.dart';
import 'package:l2t_beta/counter/counter.dart';
import 'package:l2t_beta/home/home.dart';

void main() {
  group('App', () {
    testWidgets('renders Home', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(Home), findsOneWidget);
    });
  });
}
