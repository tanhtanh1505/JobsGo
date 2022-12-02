import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class ProfileAva extends StatelessWidget {
  const ProfileAva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: const AssetImage("assets/images/Vector.png"),
          backgroundColor: AppColor.white,
          radius: 40,
        ),
      ],
    );
  }
}
