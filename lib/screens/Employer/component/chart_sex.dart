import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class ChartSex extends StatelessWidget {
  const ChartSex({super.key, required this.height, required this.heightMale});
  final double height;
  final double heightMale;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        rateSex(height, heightMale, "Male", AppColor.green),
        rateSex(height, height - heightMale, "Female", AppColor.yellow)
      ]),
    );
  }

  Widget rateSex(height, curHeight, sex, color) {
    return Container(
        padding: EdgeInsets.only(right: 5, left: 5),
        child: Column(
          children: [
            Col(height, curHeight, color),
            Text(
              '${sex}\n${(curHeight / height * 100).toStringAsFixed(0)}%',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ));
  }

  Widget Col(double height, double curHeight, color) {
    return Container(
      child: Column(
        children: [
          Container(
            height: height - curHeight,
            width: 10,
            color: AppColor.graylight,
          ),
          Container(
            height: curHeight,
            width: 10,
            color: color,
          )
        ],
      ),
    );
  }
}
