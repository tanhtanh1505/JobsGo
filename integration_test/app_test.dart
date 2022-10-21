import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jobsgo/screens/Auth/login.dart';

import './screens.dart' as apptest;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('test login', (tester) async {
      apptest.defaultHome = const Login();
      apptest.main();
      await tester.pumpAndSettle();

      final Finder loginFeild = find.text('Email');
      final Finder passwordFeild = find.text('Password');
      final Finder loginBtn = find.text('Sign in');

      expect(loginFeild, findsOneWidget);
      expect(passwordFeild, findsOneWidget);
      expect(loginBtn, findsOneWidget);

      await tester.tap(loginBtn);
      await tester.pumpAndSettle();
      expect(find.text('Invalid username or password'), findsOneWidget);
    });
  });
}
