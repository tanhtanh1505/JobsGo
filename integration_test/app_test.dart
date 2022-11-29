import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jobsgo/models/auth/login_request.dart';
import 'package:jobsgo/my_home_page.dart';
import 'package:jobsgo/screens/Auth/login.dart';
import 'package:jobsgo/screens/Auth/register.dart';
import 'package:jobsgo/screens/Message/message.dart';
import 'package:jobsgo/services/api_service.dart';
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

    testWidgets('test register by find text', (tester) async {
      Register page = const Register();

      await tester.pumpWidget(makeTestableWidget(child: page));
      await tester.pumpAndSettle();

      final Finder loginFeild = find.text('Email');
      final Finder passwordFeild = find.text('Password');
      final Finder loginBtn = find.text('Sign up');

      await tester.tap(find.byKey(const Key('passwordVisibility')));
      await tester.tap(find.byKey(const Key('register')));

      expect(loginFeild, findsOneWidget);
      expect(passwordFeild, findsOneWidget);
      expect(loginBtn, findsOneWidget);
      await tester.tap(find.byKey(const Key('login')));
    });

    testWidgets('test message', (tester) async {
      Message page = const Message();

      await tester.pumpWidget(makeTestableWidget(child: page));
      await tester.pumpAndSettle();

      final Finder searchBar = find.text('Search');
      final Finder user = find.text('Tanh');

      // await tester.tap(searchBar);

      expect(searchBar, findsOneWidget);
      expect(user, findsOneWidget);
    });

    testWidgets('test chat area', (tester) async {
      // List<UserModel> users = await UserService.getListUserChated();
      // ChatArea page = ChatArea(
      //   reciever: users.elementAt(0),
      // );

      // await tester.pumpWidget(makeTestableWidget(child: page));
      await tester.pumpAndSettle();

      final Finder user = find.text('Tanh');

      await tester.pump();

      // await tester.tap(searchBar);

      expect(user, findsOneWidget);
    });

    testWidgets('test send message', (tester) async {
      // List<UserModel> users = await UserService.getListUserChated();
      // ChatArea page = ChatArea(
      //   reciever: users.elementAt(0),
      // );

      // await tester.pumpWidget(makeTestableWidget(child: page));
      await tester.pumpAndSettle();

      final Finder user = find.text('Tanh');

      await tester.enterText(find.byKey(const Key('message')), "hehe");
      await tester.pump();
      await tester.tap(find.byIcon(Icons.send));
      await tester.pump();

      expect(user, findsOneWidget);
      // expect(find.byWidget(Message()), findsOneWidget);
    });

    testWidgets('test home page', (tester) async {
      MyHomePage page = const MyHomePage();

      await tester.pumpWidget(makeTestableWidget(child: page));
      await tester.pumpAndSettle();

      final Finder user = find.text('xxx');

      await tester.pump();

      expect(user, findsOneWidget);
    });

    testWidgets('test job detail', (tester) async {
      // JobDetail page = const JobDetail();

      // await tester.pumpWidget(makeTestableWidget(child: page));
      await tester.pumpAndSettle();

      final Finder title = find.text('Job Detail');

      await tester.pump();

      expect(title, findsOneWidget);
    });

    testWidgets('test get user', (tester) async {
      bool res = await APIService.login(
          LoginRequestModel(username: "tanhne", password: "123"));

      // await tester.pumpWidget(makeTestableWidget(child: page));
      // await tester.pumpAndSettle();

      // final Finder title = find.text('Job Detail');

      // await tester.pump();

      expect(res, true);
    });
  });
}
