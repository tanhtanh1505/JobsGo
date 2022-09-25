import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Home/component/Categories.dart';
import 'package:jobsgo/screens/Home/component/Header.dart';
import 'package:jobsgo/screens/Home/component/JobsSuggest.dart';
import '../../component/SearchBar.dart';
import '../../component/Advertisement.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Header(),
          backgroundColor: Colors.transparent,
          toolbarHeight: 110,
          elevation: 0.0,
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 30, right: 30),
          children: const <Widget>[
            SearchBar(text: "Search"),
            Advertisement(),
            Categories(),
            JobsSuggest(),
          ],
        ),
      );
}
