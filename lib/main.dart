import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:jobsgo/my_home_page.dart';
import 'package:jobsgo/screens/WelcomePages/welcome_page.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:logger/logger.dart';

import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();

  Logger().d('Handling a background message ${message.messageId}');
}

Widget defaultHome = const WelcomePage();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  Logger().d('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  bool result = await SharedService.isLoggedIn();
  if (result) {
    defaultHome = const MyHomePage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) {
        return MaterialApp(
          title: 'jobsgo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Poppins',
              useMaterial3: true),
          home: defaultHome,
        );
      },
      maximumSize: const Size(500.0, 812.0),
      enabled: kIsWeb,
    );
  }
}