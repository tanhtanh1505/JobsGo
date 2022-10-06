// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.green[900],
        fontSize: 45,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
