import 'package:firebase_messaging/firebase_messaging.dart';

import 'screens/Home/home.dart';
import 'screens/SavedJobs/saved_jobs.dart';
import 'screens/Application/application.dart';
import 'screens/Message/message.dart';
import 'screens/Profile/profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Messsss $message');
      final snackBar = SnackBar(
        content: Text(message.notification?.title ?? ""),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
    FirebaseMessaging.instance.getToken().then((value) {
      print('Token $value');
    });
  }

  int currentIndex = 0;
  final screens = [
    const Home(),
    const SavedJobs(),
    const Application(),
    const Message(),
    const Profile(),
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
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ballot_outlined),
              label: 'Apply',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.portrait),
              label: 'Profile',
            ),
          ]),
    );
  }
}
