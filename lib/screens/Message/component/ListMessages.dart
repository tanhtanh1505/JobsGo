// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jobsgo/models/user_model.dart';
import 'package:jobsgo/screens/Message/component/ChatItem.dart';
import 'package:jobsgo/services/api_service.dart';

class ListMessages extends StatefulWidget {
  const ListMessages({super.key});

  @override
  State<ListMessages> createState() => _ListMessagesState();
}

class _ListMessagesState extends State<ListMessages> {
  var isLoaded = false;
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();

    //fetch data
    getData();
  }

  getData() async {
    users = await APIService.getListUserChated();
    if (users.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatItem(user: users.elementAt(index));
        },
      ),
    );
  }
}
