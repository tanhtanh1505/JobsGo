import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobsgo/component/AvatarWidget.dart';
import 'package:jobsgo/models/user_model.dart';

class HeaderChatArea extends StatelessWidget {
  const HeaderChatArea({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          AvatarWidget(
            height: 45,
            width: 45,
            urlImage: user.avatar,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(user.name),
          ),
        ],
      ),
    );
  }
}
