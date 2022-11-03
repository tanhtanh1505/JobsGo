import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jobsgo/screens/Auth/login.dart';
import 'package:jobsgo/services/shared_service.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    Widget makeTestableWidget({required Widget child}) {
      return MaterialApp(
        home: child,
      );
    }

    testWidgets('test login by find text', (tester) async {
      Login page = const Login();

      await tester.pumpWidget(makeTestableWidget(child: page));
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
    testWidgets('email or password is empty, does not sign in',
        (WidgetTester tester) async {
      Login page = const Login();

      await tester.pumpWidget(makeTestableWidget(child: page));

      await tester.tap(find.byKey(const Key('login_btn')));

      bool didSignIn = await SharedService.isLoggedIn();
      expect(didSignIn, true);
      expect(find.text('Invalid username or password'), findsOneWidget);
    });

    testWidgets(
        'non-empty email and password, valid account, call sign in, succeed',
        (WidgetTester tester) async {
      Login page = const Login();

      await tester.pumpWidget(makeTestableWidget(child: page));

      Finder emailField = find.byKey(const Key('email_feild'));
      await tester.enterText(emailField, 'tanhne');
      await tester.pumpAndSettle();

      Finder passwordField = find.byKey(const Key('password_feild'));
      await tester.enterText(passwordField, '123');
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('login_btn')));
      await tester.pumpAndSettle();

      bool didSignIn = await SharedService.isLoggedIn();
      expect(didSignIn, true);
      expect(find.text('Invalid username or password'), findsNothing);
    });
  });
}
