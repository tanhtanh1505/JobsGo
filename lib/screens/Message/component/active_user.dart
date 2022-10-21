import 'package:flutter/material.dart';
import 'package:jobsgo/component/avatar_widget.dart';

class ActiveUser extends StatefulWidget {
  const ActiveUser({super.key});

  @override
  State<ActiveUser> createState() => _ActiveUserState();
}

class _ActiveUserState extends State<ActiveUser> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return activeUserCard();
        },
      ),
    );
  }

  Widget activeUserCard() {
    return const AvatarWidget();
  }
}
