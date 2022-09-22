import 'package:flutter/material.dart';
import 'package:jobsgo/component/Category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Browser by categories",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Category(title: "Remote", urlImage: 'assets/images/remote.png'),
                Category(
                    title: "Freelance",
                    urlImage: 'assets/images/freelance.png'),
                Category(
                    title: "Fulltime", urlImage: 'assets/images/fulltime.png'),
                Category(
                    title: "Internship",
                    urlImage: 'assets/images/internship.png'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
