import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobsgo/models/user_model.dart';
import 'package:jobsgo/screens/Message/component/ChatItem.dart';

class ListMessages extends StatefulWidget {
  const ListMessages({super.key});

  @override
  State<ListMessages> createState() => _ListMessagesState();
}

class _ListMessagesState extends State<ListMessages> {
  var isLoaded = true;
  List<UserModel> listUser = [];
  @override
  void initState() {
    super.initState();

    //fetch data
    getData();
  }

  getData() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return const ChatItem();
        },
      ),
    );
  }
}
