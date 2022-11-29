import 'package:flutter/material.dart';
import 'package:jobsgo/screens/SearchPage/search_page.dart';
import 'package:jobsgo/themes/styles.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // return TextField(
    //   onTap: () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => const SearchPage(),
    //     ),
    //   ),
    //   decoration: InputDecoration(
    //     contentPadding: const EdgeInsets.all(16),
    //     prefixIcon: const Icon(Icons.search),
    //     border: const OutlineInputBorder(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(12),
    //       ),
    //     ),
    //     hintText: text,
    //   ),
    // );

    return content(context);
  }

  Widget content(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.gray,
                width: 1,
                style: BorderStyle.solid), //Border.all
            /*** The BorderRadius widget  is here ***/
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Icon(
                Icons.search_outlined,
                color: AppColor.gray,
                size: 33,
              ),
            ),
            Text(
              text,
              style: TextStyle(color: AppColor.gray, fontSize: 16),
            ),
          ]),
        ));
  }
}
