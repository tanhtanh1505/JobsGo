// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Auth/Login.dart';
import 'package:jobsgo/screens/Auth/Register.dart';
import 'package:jobsgo/screens/WelcomePages/welcome_page1.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            color: const Color(0xffFFFFFF),
          ),
          Positioned(
            top: 142,
            child: Image.asset(
              "assets/images/login.png",
              height: 269,
              width: 315.88,
            ),
          ),
          const Positioned(
            bottom: 330,
            left: 30,
            child: Text(
              "Welcome",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: "Poppins",
              ),
            ),
          ),
          const Positioned(
            bottom: 300,
            left: 30,
            child: Text(
              "Search for vacanies from top companies",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
              ),
            ),
          ),
          const Positioned(
            bottom: 283,
            left: 30,
            child: Text(
              "and find your dream carreer!",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            left: 28.8,
            child: SizedBox(
              height: 47.29,
              width: 138.24,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Register();
                      },
                    ),
                  );
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3586D7)),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xff3586D7)),
                ))),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            right: 28.8,
            child: SizedBox(
              height: 47.29,
              width: 138.24,
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
                // ignore: sort_child_properties_last
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3586D7)),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color(0xff3586D7)),
                ))),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            child: SizedBox(
              height: 47.29,
              width: 302.4,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const welcome_page1();
                      },
                    ),
                  );
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  "Start Exploring",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff176DC2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.black),
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
