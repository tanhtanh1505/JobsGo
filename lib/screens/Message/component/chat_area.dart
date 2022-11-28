// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:jobsgo/models/conversation/conversation.dart';
import 'package:jobsgo/models/message/message_response.dart';
import 'package:jobsgo/screens/Message/component/message_item.dart';
import 'package:jobsgo/config.dart';
import 'package:jobsgo/models/message/message.dart';
import 'package:jobsgo/models/user/user.dart';
import 'package:jobsgo/screens/Message/component/header_chat_area.dart';
import 'package:jobsgo/services/chat_service.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:jobsgo/themes/styles.dart';

// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatArea extends StatefulWidget {
  const ChatArea({super.key, required this.conversation, this.textSend = ""});

  final String textSend;
  final ConversationModel conversation;

  @override
  State<ChatArea> createState() => _ChatAreaState();
}

class _ChatAreaState extends State<ChatArea> {
  late IO.Socket socket;
  bool isLoaded = false;

  List<MessageItem> messageList = [];
  final textEditingController = TextEditingController();
  late UserModel user;

  @override
  void initState() {
    super.initState();
    initSocket();
    getUser();
    getOldMessage();
    textEditingController.text = widget.textSend;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditingController.dispose();
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  getOldMessage() async {
    var tempOldMessage =
        await ChatService.getListMessage(widget.conversation.id);
    setState(() {
      //revert tempOldMessage
      tempOldMessage = tempOldMessage.reversed.toList();
      messageList = tempOldMessage.map((e) {
        Message resMess =
            Message(sender: e.sender, content: e.content, status: e.status);
        return MessageItem(isMine: e.sender == user.id, message: resMess);
      }).toList();
      isLoaded = true;
    });
  }

  getUser() async {
    user = await SharedService.userInfo();
    if (user != exampleUser()) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  initSocket() {
    socket = IO.io('https://${Config.apiURL}', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      if (isLoaded) socket.emit("joinRoom", widget.conversation.id);
    });
    socket.on('receiveMessage', (newMessage) {
      Message newMess = Message.fromJson(newMessage);
      setState(() {
        messageList.add(
            MessageItem(isMine: newMess.sender == user.id, message: newMess));
      });
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }

  sendMessage() {
    String message = textEditingController.text.trim();
    if (message.isEmpty) return;
    Message newMsg =
        Message(sender: user.id, content: message, status: "sending");
    socket.emit('sendMessage', [widget.conversation.id, newMsg.toJson()]);
    textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 28,
        backgroundColor: AppColor.blue,
        title: HeaderChatArea(user: widget.conversation.other),
      ),
      body: Column(
        children: [
          Expanded(
            child: bodyChat(context),
          ),
          sendBox(context),
        ],
      ),
    );
  }

  Widget bodyChat(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: messageList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return messageList.elementAt(index);
        }),
      ),
    );
  }

  Widget sendBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: AppColor.white,
      child: Row(
        children: [
          iconButton(
              Icon(Icons.add_circle_rounded, color: AppColor.blue), () {}),
          iconButton(
              Icon(Icons.camera_alt_rounded, color: AppColor.blue), () {}),
          iconButton(Icon(Icons.photo, color: AppColor.blue), () {}),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12),
              child: TextField(
                key: const Key('message'),
                controller: textEditingController,
                decoration:
                    const InputDecoration.collapsed(hintText: "Send a message"),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
          ),
          iconButton(Icon(Icons.send, color: AppColor.blue), () {
            sendMessage();
          }),
        ],
      ),
    );
  }

  Widget iconButton(Icon icon, Function onPress) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(onTap: () => onPress(), child: icon),
    );
  }
}
