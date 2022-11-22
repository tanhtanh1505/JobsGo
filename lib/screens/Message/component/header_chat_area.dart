import 'package:flutter/material.dart';
import 'package:jobsgo/component/avatar_widget.dart';
import 'package:jobsgo/models/user/user.dart';

class HeaderChatArea extends StatelessWidget {
  const HeaderChatArea({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarWidget(
          height: 45,
          width: 45,
          urlImage: user.avatar,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(user.name),
        ),
      ],
    );
  }
}
