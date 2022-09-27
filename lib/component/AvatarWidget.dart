import 'package:flutter/cupertino.dart';

class AvatarWidget extends StatelessWidget {
  final double height;
  final double width;
  final String urlImage;
  final double radius;

  const AvatarWidget(
      {Key? key,
      this.height = 50,
      this.width = 50,
      this.urlImage = 'assets/images/logo.jpg',
      this.radius = 45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(urlImage),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    );
  }
}
