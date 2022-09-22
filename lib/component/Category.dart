import 'package:flutter/material.dart';
import 'package:jobsgo/component/ButtonImage.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.title, required this.urlImage});

  final String title;
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: ButtonImage(
            urlImage: urlImage,
          )),
      Text(
        title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ]);
  }
}
