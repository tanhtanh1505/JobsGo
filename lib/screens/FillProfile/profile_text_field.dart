import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({Key? key,
    required this.hintText,
    required this.icon})
      :super(key: key);

  final String hintText;
  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(29, 20, 29, 0),
      // padding: const EdgeInsets.only(left: 23, right: 29),
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
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffCCCCCC),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
