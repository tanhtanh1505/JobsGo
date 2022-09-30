import 'package:flutter/material.dart';
import 'package:jobsgo/main.dart';
import 'package:jobsgo/screens/Register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool value = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(135, 90, 135, 0),
                  child: Image.asset(
                    'assets/images/Logo.png',
                    height: 90.0,
                    width: 90.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 29, 29, 0),
                  child: const Text(
                    "Login to Your Account",
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(29, 28, 30, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Color(0xffF6F6F6),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xffCCCCCC),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Color(0xffCCCCCC),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(29, 28, 30, 0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Color(0xffF6F6F6),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xffCCCCCC),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState (() {
                              _obscureText = !_obscureText;
                          });
                          },
                        child: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                          color: Color(0xffCCCCCC),
                        ),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Color(0xffCCCCCC),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    obscureText: _obscureText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(97, 35, 97, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildCheckbox(),
                      Text(
                        'Remember me',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 94,
                  width: 604,
                  padding: const EdgeInsets.fromLTRB(29, 31, 29, 0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return MyHomePage(title: "Flutter Demo");
                        },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff1976D2)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 94,
                  width: 604,
                  padding: const EdgeInsets.fromLTRB(81, 28, 80, 0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF1979D2),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(43, 66, 45, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't you have an account?",
                          style: TextStyle(
                            color: Color(0xffA9A9A9),
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Register();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: Color(0xFF1979D2),
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCheckbox() => Checkbox(
        value: value,
        onChanged: (value) {
          setState(() {
            this.value = value!;
          });
        },
        activeColor: Color(0xff1976D2),
        checkColor: Colors.white,
      );
}
