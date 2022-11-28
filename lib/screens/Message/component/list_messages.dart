import 'package:flutter/material.dart';
import 'package:jobsgo/models/conversation/conversation.dart';
import 'package:jobsgo/models/user/user.dart';
import 'package:jobsgo/screens/Message/component/chat_item.dart';
import 'package:jobsgo/services/chat_service.dart';

class ListMessages extends StatefulWidget {
  const ListMessages({super.key});

  @override
  State<ListMessages> createState() => _ListMessagesState();
}

class _ListMessagesState extends State<ListMessages> {
  var isLoaded = false;
  List<UserModel> users = [];
  List<ConversationModel> conversations = [];

  @override
  void initState() {
    super.initState();

    //fetch data
    getData();
  }

  getData() async {
    var tempConversation = await ChatService.getListConversation();
    setState(() {
      for (ConversationModel c in tempConversation) {
        if (c.lastMsg != null && c.lastMsg.toString().isNotEmpty) {
          conversations.add(c);
        }
      }
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: ListView.builder(
        itemCount: conversations.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatItem(
            conversation: conversations.elementAt(index),
          );
        },
      ),
    );
  }
}
