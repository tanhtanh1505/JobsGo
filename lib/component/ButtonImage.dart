// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({super.key, required this.urlImage, required this.goto});

  final String urlImage;
  final Widget goto;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => goto,
              ),
            ),
        child: Container(
          height: 55,
          width: 55,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: AppColor.graylight, //#FAFAFA
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Image(image: AssetImage(urlImage)),
        ));
  }
}
