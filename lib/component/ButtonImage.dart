import 'package:flutter/material.dart';

import '../helper/ColorHelper.dart';
import '../screens/Profile.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({super.key, required this.urlImage});

  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Profile(),
              ),
            ),
        child: Container(
          height: 55,
          width: 55,
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color:
                ColorHelper.colorFromHex("#f0f0f0").withOpacity(0.6), //#FAFAFA
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Image(image: AssetImage(urlImage)),
        ));
  }
}
