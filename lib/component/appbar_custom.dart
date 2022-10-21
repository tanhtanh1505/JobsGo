import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Profile/profile.dart';
import 'package:jobsgo/themes/styles.dart';

class AppbarCustom extends StatelessWidget {
  const AppbarCustom({
    super.key,
    required this.title,
    this.canBack = false,
  });

  final String title;
  final bool canBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w700,
                fontSize: 22),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Icon(Icons.more_horiz_rounded, color: AppColor.black),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
