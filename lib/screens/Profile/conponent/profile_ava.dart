import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Auth/login.dart';
import 'package:jobsgo/themes/styles.dart';

class ProfileAva extends StatelessWidget {
  const ProfileAva({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 60,
      child: Stack(
        //fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage("assets/images/Vector.png"),
            backgroundColor: AppColor.white,
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            //alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
              },
              child: Image.asset("assets/images/pen-to-square-solid 1.png"),
            ),
          ),
        ],
      ),
    );
  }
}
