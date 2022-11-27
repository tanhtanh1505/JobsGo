import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Home/component/categories.dart';
import 'package:jobsgo/screens/Home/component/header.dart';
import 'package:jobsgo/screens/Home/component/jobs_suggest.dart';
import '../../component/search_bar.dart';
import '../../component/advertisement.dart';

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
          padding: const EdgeInsets.only(left: 25, right: 25),
          children: const <Widget>[
            SearchBar(text: "Search"),
            Advertisement(),
            Categories(),
            JobsSuggest(),
          ],
        ),
      );
}
