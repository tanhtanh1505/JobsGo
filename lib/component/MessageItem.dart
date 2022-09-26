import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobsgo/models/message_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(message.msg),
    );
  }
}
