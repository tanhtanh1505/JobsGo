import 'package:flutter/material.dart';
import 'package:jobsgo/component/appbar_custom.dart';
import 'package:jobsgo/screens/Auth/login.dart';
import 'package:jobsgo/screens/Profile/component/profile_ava.dart';
import 'profile_text_field.dart';

class FillProfile extends StatefulWidget {
  const FillProfile({Key? key}) : super(key: key);

  @override
  State<FillProfile> createState() => _FillProfileState();
}

class _FillProfileState extends State<FillProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const AppbarCustom(
          title: 'Fill Your Profile',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              children: [
                const ProfileAva(),
                Column(
                  children: [
                    Container(
                      height: 84,
                      width: 604,
                      padding: const EdgeInsets.fromLTRB(29, 20, 29, 0),
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xffF6F6F6),
                          hintText: "User Name",
                          hintStyle: const TextStyle(
                            color: Color(0xffCCCCCC),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const ProfileTextField(hintText: "Name", icon: Icons.drive_file_rename_outline_sharp),
                    const ProfileTextField(hintText: "Age", icon: Icons.cake_sharp),
                    const ProfileTextField(hintText: "Email", icon: Icons.email_sharp),
                    const ProfileTextField(hintText: "Phone number", icon: Icons.phone_enabled_sharp),
                    const ProfileTextField(hintText: "Address", icon: Icons.location_on_sharp),
                    const ProfileTextField(hintText: "Female", icon: Icons.expand_more_sharp),
                  ],
                ),
                Container(
                  height: 94,
                  width: 604,
                  padding: const EdgeInsets.fromLTRB(29, 20, 29, 15),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Login();
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xff1976D2)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}

