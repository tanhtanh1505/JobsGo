import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({super.key});

  @override
  State<Advertisement> createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: AppColor.bluel2,
        image: const DecorationImage(
          image: AssetImage("assets/images/ads.png"),
          scale: 4,
          alignment: Alignment.bottomRight,
        ),
        border: Border.all(
            color: Colors.transparent,
            width: 0,
            style: BorderStyle.solid), //Border.all
        /*** The BorderRadius widget  is here ***/
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ), //BorderRadius.all
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(left: 19, top: 27, bottom: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Top Job In March",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "Poppins"),
                ),
                const Text(
                  "UI Designer",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      fontFamily: "Poppins"),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColor.blue),
                    backgroundColor: MaterialStateProperty.all(AppColor.blue),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Read More',
                    style: TextStyle(color: AppColor.white),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
