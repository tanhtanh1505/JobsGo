import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class JDAppBar extends StatelessWidget {
  const JDAppBar({
    Key? key,
    required this.title,
    this.canBack = false,
  }) : super(key: key);

  final String title;
  final bool canBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_border),
          //color: Color(0xffA9A9A9),
          iconSize: 33,
        ),
      ],
    );
  }
}
