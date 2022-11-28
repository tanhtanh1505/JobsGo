import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    super.key,
    required this.urlImage,
    this.goto = const Text(""),
    this.isNetWorkImage = false,
    this.isStaticImage = false,
    this.width = 55,
    this.height = 55,
    this.paddingImage = 10,
  });

  final bool isNetWorkImage;
  final bool isStaticImage;
  final String urlImage;
  final Widget goto;
  final double width;
  final double height;
  final double paddingImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => !isStaticImage
          ? Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => goto,
              ),
            )
          : {},
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(paddingImage),
        decoration: BoxDecoration(
          color: AppColor.graylight, //#FAFAFA
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: isNetWorkImage
              ? Image(image: NetworkImage(urlImage))
              : Image(image: AssetImage(urlImage)),
        ),
      ),
    );
  }
}
