// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jobsgo/component/AppbarCustom.dart';
import 'package:jobsgo/screens/Profile/conponent/ProfileButton.dart';
import 'package:jobsgo/screens/Profile/conponent/ProfileAva.dart';
import 'package:jobsgo/services/shared_service.dart';
import 'package:jobsgo/themes/styles.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppbarCustom(
          title: 'Profile',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                const ProfileAva(),
                const Text(
                    "Team 7",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 15),
                  child: const Text(
                      "Senior UI/UX Designer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xffC8C8C8),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Column(
                        children: const [
                          Text(
                            "31",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),

                          Text(
                            "Applied",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xffC8C8C8),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Column(
                        children: const [
                          Text(
                            "17",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),

                          Text(
                            "Reviewed",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xffC8C8C8),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Column(
                        children: const [
                          Text(
                            "5",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),

                          Text(
                            "Contacted",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xffC8C8C8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.only(left: 22),
            child: const Text(
              "ACCOUNT",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xffC8C8C8),),
            ),
          ),

          const ProfileButton(
            text: 'Personal Data',
            asset: "assets/images/Account.png",
            //press: () => {},
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: ProfileButton(
              text: 'Resume & My info',
              asset: "assets/images/Info.png",
              //press: () => {},
            ),
          ),
          const ProfileButton(
            text: 'My Application',
            asset: "assets/images/Application.png",
            //press: () => {},
          ),

          Container(
            padding: const EdgeInsets.only(left: 22),
            child: const Text(
              "OTHER",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xffC8C8C8),),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ProfileButton(
              text: 'Setting',
              asset: "assets/images/Setting.png",
              //press: () => {},
            ),
          ),

          const ProfileButton(
            text: 'Logout',
            asset: "assets/images/Setting.png",
            //press: () => {},
          ),
        ],
      ),
    );
  }
}
