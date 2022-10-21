import 'package:flutter/material.dart';
import 'package:jobsgo/component/appbar_custom.dart';
import 'package:jobsgo/component/search_bar.dart';
import 'package:jobsgo/screens/Message/component/list_messages.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppbarCustom(
          title: 'Message',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        // padding: const EdgeInsets.only(left: 30, right: 30),
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: SearchBar(text: "Search"),
          ),
          Expanded(child: ListMessages())
        ],
      ),
    );
  }
}
