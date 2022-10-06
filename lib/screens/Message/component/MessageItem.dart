// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jobsgo/models/message_model.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, this.isMine = false, required this.message});

  final MessageModel message;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // asymmetric padding
      padding: EdgeInsets.fromLTRB(
        isMine ? 64.0 : 16.0,
        2,
        isMine ? 16.0 : 64.0,
        2,
      ),
      child: Align(
        // align the child within the container
        alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isMine ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              message.msg,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: isMine ? Colors.white : Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
