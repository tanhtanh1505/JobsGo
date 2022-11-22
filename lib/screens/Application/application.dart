import 'package:flutter/material.dart';
import 'package:jobsgo/component/appbar_custom.dart';
import 'package:jobsgo/component/search_bar.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppbarCustom(
          title: 'Application',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 30, right: 30),
        children: const <Widget>[
          SearchBar(text: "Search"),
        ],
      ),
    );
  }
}
