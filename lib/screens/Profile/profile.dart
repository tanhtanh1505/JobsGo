import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsgo/component/appbar_custom.dart';
import 'package:jobsgo/screens/Auth/login.dart';
import 'package:jobsgo/screens/Profile/component/profile_button.dart';
import 'package:jobsgo/screens/Profile/component/profile_ava.dart';
import 'package:jobsgo/services/cv_service.dart';
import 'package:jobsgo/themes/styles.dart';
import 'package:url_launcher/url_launcher.dart';

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
            padding: const EdgeInsets.only(left: 32),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: const Text(
              "Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xffC8C8C8),
              ),
            ),
          ),
          const ProfileButton(
            text: 'Personal Data',
            asset: "assets/images/Account.png",
          ),
          const ProfileButton(
            key: Key('profile_button_cv'),
            text: 'Resume & My Cv',
            asset: "assets/images/Info.png",
          ),
          const ProfileButton(
            text: 'My Application',
            asset: "assets/images/Application.png",
          ),
          Container(
            padding: const EdgeInsets.only(left: 32),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: const Text(
              "Other",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xffC8C8C8),
              ),
            ),
          ),
          const ProfileButton(
            text: 'Setting',
            asset: "assets/images/Setting.png",
          ),
          ProfileButton(
            text: 'Generate CV',
            asset: "assets/images/Setting.png",
            onClick: () {},
          ),
          const ProfileButton(
            text: 'Logout',
            asset: "assets/images/Logout.png",
            goto: Login(),
          ),
        ],
      ),
    );
  }
}
