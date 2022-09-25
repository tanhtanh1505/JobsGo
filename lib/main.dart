import 'package:flutter/material.dart';
import 'package:jobsgo/screens/WelcomePages/WelcomePage.dart';
import 'screens/Home.dart';
import 'screens/SavedJobs.dart';
import 'screens/Application.dart';
import 'screens/Message.dart';
import 'screens/Profile.dart';

void main() {
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
      home: const WelcomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    Home(),
    SavedJobs(),
    Application(),
    Message(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(
                () => currentIndex = index,
              ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'Saved Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ballot_outlined),
              label: 'Applications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.portrait),
              label: 'Profile',
            )
          ]),
    );
  }
}
