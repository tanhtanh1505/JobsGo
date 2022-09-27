import 'package:flutter/material.dart';
import 'package:jobsgo/component/MessageItem.dart';
import 'package:jobsgo/config.dart';
import 'package:jobsgo/models/login_response_model.dart';
import 'package:jobsgo/models/message_model.dart';
import 'package:jobsgo/models/user_model.dart';
import 'package:jobsgo/services/shared_service.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatArea extends StatefulWidget {
  const ChatArea({super.key, required this.reciever});

  final UserModel reciever;

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
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditingController.dispose();
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  getUser() async {
    user = await SharedService.userInfo();
    if (user != exampleUser()) {
      setState(() {
        isLoaded = true;
        socket.emit("join", user.username);
      });
    }
  }

  initSocket() {
    socket = IO.io(Config.socket, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
      if (isLoaded) socket.emit("join", user.username);
    });
    socket.on('getMessage', (newMessage) {
      MessageModel newMess = messageModelFromJson(newMessage);
      if (newMess != failureMessage &&
          newMess.senderId == widget.reciever.username) {
        setState(() {
          messageList.add(MessageItem(message: newMess));
        });
      }
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }

  sendMessage() {
    String message = textEditingController.text.trim();
    if (message.isEmpty) return;
    MessageModel newMsg = MessageModel(
        senderId: user.username,
        recieverId: widget.reciever.username,
        msg: textEditingController.text.trim());
    socket.emit('sendNewMessage', newMsg.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reciever.username),
      ),
      body: Column(
        children: [bodyChat(context), sendBox(context)],
      ),
    );
  }

  Widget bodyChat(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            itemCount: messageList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return messageList.elementAt(index);
            }),
          )
        ],
      ),
    );
  }

  Widget sendBox(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textEditingController,
        ),
        TextButton(
          // When the user presses the button, show an alert dialog containing
          // the text that the user has entered into the text field.
          onPressed: () {
            sendMessage();
          },
          child: const Icon(Icons.text_fields),
        ),
      ],
    );
  }
}
