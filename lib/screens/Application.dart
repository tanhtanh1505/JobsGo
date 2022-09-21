import 'package:flutter/material.dart';

import '../component/TitleText.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: const Center(
        child: TitleText(
          text: "Application Screen",
        ),
      ),
    );
  }
}
