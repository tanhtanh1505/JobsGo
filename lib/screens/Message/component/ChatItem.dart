import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobsgo/screens/Message/component/ChatArea.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('tanhne'),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatArea(recieverId: 'tanhne'),
        ),
      ),
    );
  }
}
