import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 238, 246, 255),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 5),
              child: Icon(Icons.search,
                  size: 25, color: Color.fromARGB(255, 189, 189, 189)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 189, 189, 189),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 110, top: 5),
              child: Icon(Icons.tune,
                  size: 25, color: Color.fromARGB(255, 14, 16, 18)),
            ),
          ],
        ),
      ),
    );
  }
}
