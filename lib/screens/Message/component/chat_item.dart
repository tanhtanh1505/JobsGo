import 'package:flutter/material.dart';
import 'package:jobsgo/component/avatar_widget.dart';
import 'package:jobsgo/models/conversation/conversation.dart';
import 'package:jobsgo/screens/Message/component/chat_area.dart';
import 'package:jobsgo/themes/styles.dart';

class ChatItem extends StatefulWidget {
  const ChatItem({super.key, required this.conversation});

  final ConversationModel conversation;
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
          builder: (context) => ChatArea(
            conversation: widget.conversation,
          ),
        ),
      ),
    );
  }

  Widget itemUserChat(BuildContext context) {
    return widget.conversation.lastMessage != null
        ? Container(
            height: 60,
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: [
                AvatarWidget(urlImage: widget.conversation.other.avatar),
                infoMessage(),
                Expanded(child: timeLastMess()),
              ],
            ),
          )
        : Container();
  }

  Widget infoMessage() {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.conversation.other.name,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            widget.conversation.lastMessage!.content.length > 20
                ? '${widget.conversation.lastMessage!.content.substring(0, 20)}...'
                : widget.conversation.lastMessage!.content,
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
            widget.conversation.lastMessage!.createdAt
                .toString()
                .substring(10, 16),
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
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Colors.transparent),
        child: Text(
          widget.countLastMessage.toString(),
          style: const TextStyle(color: Colors.transparent),
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
