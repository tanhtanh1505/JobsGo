import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.w700,
                fontSize: 22),
          )
        ],
      ),
    );
  }
}
