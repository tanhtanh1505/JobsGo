import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobsgo/component/AvatarWidget.dart';
import 'package:jobsgo/models/user_model.dart';
import 'package:jobsgo/screens/Message/component/ChatArea.dart';
import 'package:jobsgo/themes/styles.dart';

class ChatItem extends StatefulWidget {
  const ChatItem({super.key, required this.user});

  final UserModel user;
  final String lastMessage = 'Hello';
  final int countLastMessage = 0;
  final String timeLastMessage = 'Yesterday';

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: itemUserChat(context),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatArea(reciever: widget.user),
        ),
      ),
    );
  }

  Widget itemUserChat(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          AvatarWidget(urlImage: widget.user.avatar),
          infoMessage(),
          Expanded(child: timeLastMess()),
        ],
      ),
    );
  }

  Widget infoMessage() {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.user.name,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            widget.lastMessage,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget timeLastMess() {
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            widget.timeLastMessage,
            style: TextStyle(color: AppColor.gray),
          ),
          countLastMess()
        ],
      ),
    );
  }

  Widget countLastMess() {
    if (widget.countLastMessage == 0) {
      return Container(
        width: 20,
        height: 20,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
        child: Text(
          widget.countLastMessage.toString(),
          style: TextStyle(color: Colors.transparent),
        ),
      );
    }
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.blue),
      child: Text(
        widget.countLastMessage.toString(),
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
