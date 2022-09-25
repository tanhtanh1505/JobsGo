import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Profile/conponent/Username.dart';

import '../../component/TitleText.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: const Center(
        child: Username(),
      ),
    );
  }
}
