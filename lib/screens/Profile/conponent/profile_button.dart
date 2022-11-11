import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';
// ignore_for_file: file_names

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
    required this.text,
    required this.asset,
  }) : super(key: key);

  final String text, asset;
  //final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 3),
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Image.asset(asset),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
