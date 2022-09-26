import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jobsgo/screens/WelcomePages/welcome_page2.dart';


class welcome_page1 extends StatelessWidget {
  const welcome_page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(height: size.height, width: double.infinity, color: Color(0xffFAFAFA),),

          Positioned(
            top: 110,
            child: Image.asset(
              "assets/images/welcome_page1.png",
              height: 400,
              width: 400,
            ),
          ),

         Positioned(
           bottom: 220,
           child: Center(
             child: Text(
               "We are the best job",
               style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontFamily: "Poppins", color: Color(0xff176DC2), inherit: false),
               softWrap: true,
             ),
             ),
         ),

          Positioned(
            bottom: 180,
            child: Center(
              child: Text(
                "portal platform",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, fontFamily: "Poppins", color: Color(0xff176DC2), inherit: false),
                softWrap: true,
              ),
            ),
          ),

          Positioned(
            bottom: 140,
            child: Center(
              child: Text(
                "Choose a job you love, and you will never ",
                style: TextStyle(fontSize: 18, fontFamily: "Poppins", color: Colors.black, inherit: false),
                softWrap: true,
              ),
            ),
          ),

          Positioned(
            bottom: 120,
            child: Center(
              child: Text(
                "have to work a day in your life",
                style: TextStyle(fontSize: 18, fontFamily: "Poppins", color: Colors.black, inherit: false),
                softWrap: true,
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            child: SizedBox(
              height: 55,
              width: 302.4,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return welcome_page2();
                      },
                    ),
                  );
                },
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 17, fontFamily: "Poppins", fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff176DC2)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.black),
                    ))

                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
