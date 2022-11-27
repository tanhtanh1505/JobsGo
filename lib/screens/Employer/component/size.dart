import 'package:flutter/material.dart';
import 'package:jobsgo/component/avatar_widget.dart';
import 'package:jobsgo/screens/Employer/component/chart_sex.dart';
import 'package:jobsgo/themes/styles.dart';

class SizeCompany extends StatelessWidget {
  const SizeCompany({super.key, required this.size});
  final int size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AvatarWidget(
            width: 75,
            height: 75,
            radius: 0,
            borderColor: Colors.transparent,
            // backgroundColor: AppColor.blue,
            urlImage:
                'https://jobsgo-storage.s3.ap-southeast-1.amazonaws.com/images/6383a34b103f7b21d2cffe68',
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    size.toString(),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(' employers')
                ],
              ),
              const Text('Average age: 25'),
            ],
          ),
          const ChartSex(height: 100.0, heightMale: 46.0)
        ],
      ),
    );
  }
}
