import 'package:flutter/material.dart';
import '../component/TitleText.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: const <Widget>[
              TitleText(
                text: "text",
              )
            ],
          ),
        ),
        body: ListView(
          children: const [
            TitleText(
              text: "text",
            ),
          ],
        ),
      );
}
