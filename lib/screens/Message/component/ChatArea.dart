import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Message/component/MessageItem.dart';
import 'package:jobsgo/config.dart';
import 'package:jobsgo/models/login_response_model.dart';
import 'package:jobsgo/models/message_model.dart';
import 'package:jobsgo/models/user_model.dart';
import 'package:jobsgo/screens/Message/component/HeaderChatArea.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:jobsgo/themes/styles.dart';

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
        msg: message);
    socket.emit('sendNewMessage', newMsg.toJson());
    setState(() {
      messageList.add(MessageItem(isMine: true, message: newMsg));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 28,
        backgroundColor: AppColor.blue,
        title: HeaderChatArea(user: widget.reciever),
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
              padding: EdgeInsets.only(left: 12),
              child: TextField(
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
