import 'package:flutter/material.dart';
import 'package:jobsgo/models/user_model.dart';
import 'package:jobsgo/services/api_service.dart';
import 'package:jobsgo/themes/styles.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          //name
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: username(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Find your dream job!",
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //noti
          Expanded(
            child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 18),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 189, 189, 189),
                          width: 0.8,
                          style: BorderStyle.solid), //Border.all
                      /*** The BorderRadius widget  is here ***/
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ), //BorderRadius.all
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(Icons.notifications_none_outlined,
                          size: 25, color: AppColor.black),
                    ))),
          ),
        ],
      ),
    );
  }

  Widget username() {
    return FutureBuilder(
      future: APIService.getUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> model) {
        if (model.hasData) {
          return Text(
            "Hello ${model.data!.name}",
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          );
        }

        return const Text(
          "Hello xxx",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        );
      },
    );
  }
}
