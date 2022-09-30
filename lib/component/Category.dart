import 'package:flutter/material.dart';
import 'package:jobsgo/component/ButtonImage.dart';
import 'package:jobsgo/screens/Message/Message.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.title, required this.urlImage});

  final String title;
  final String urlImage;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          padding: const EdgeInsets.only(bottom: 8),
          child: ButtonImage(
            urlImage: widget.urlImage,
            goto: const Message(),
          )),
      Text(
        widget.title,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    ]);
  }
}
