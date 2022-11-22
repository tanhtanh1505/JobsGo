import 'package:flutter/material.dart';
import 'package:jobsgo/my_home_page.dart';
import 'package:jobsgo/screens/WelcomePages/welcome_page.dart';
import 'package:jobsgo/services/shared_service.dart';

Widget defaultHome = const WelcomePage();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp(
      title: 'jobsgo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: defaultHome,
    );
  }
}