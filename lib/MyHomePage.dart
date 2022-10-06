// ignore_for_file: file_names

import 'screens/Home/Home.dart';
import 'screens/SavedJobs/SavedJobs.dart';
import 'screens/Application/Application.dart';
import 'screens/Message/Message.dart';
import 'screens/Profile/Profile.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
