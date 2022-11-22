import 'package:flutter/material.dart';
import 'package:jobsgo/screens/Auth/login.dart';
import 'package:jobsgo/screens/Auth/register.dart';
import 'package:jobsgo/screens/WelcomePages/welcome_page1.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffFFFFFF),
        child: Column(
          children: [
            Container(
              //height: 269,
              //width: 315.88,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 131),
              child: Image.asset(
                "assets/images/login.png",
                height: 269,
                width: 315.88,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 42, left: 50),
              child: const Text(
                "Welcome",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 10, left: 50, right: 35),
              child: const Text(
                "Search for vacancies from top companies and find your dream career!",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 24, left: 50, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
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
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xff3586D7)),
                          ))),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3586D7)),
                      ),
                    ),
                  ),
                  SizedBox(
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
                      style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xff3586D7)),
                          ))),
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3586D7)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 50, right: 35),
              //height: 77,
              //width: 315.4,
              child: SizedBox(
                height: 50.29,
                width: 340.4,
                child: TextButton(
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
                        //side: const BorderSide(color: Colors.black),
                      ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}