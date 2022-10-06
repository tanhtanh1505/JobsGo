// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:jobsgo/themes/styles.dart';

class AvatarWidget extends StatelessWidget {
  final double height;
  final double width;
  final String urlImage;
  final double radius;

  const AvatarWidget(
      {Key? key,
      this.height = 50,
      this.width = 50,
      this.urlImage =
          'https://img.freepik.com/free-vector/cute-cat-with-love-sign-hand-cartoon-illustration-animal-nature-concept-isolated-flat-cartoon-style_138676-3419.jpg?w=2000',
      this.radius = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.fill,
        ),
        border: Border.all(width: 2, color: AppColor.blue),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
