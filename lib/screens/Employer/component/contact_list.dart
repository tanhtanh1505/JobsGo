import 'package:flutter/material.dart';
import 'package:jobsgo/themes/styles.dart';

class ContactList extends StatelessWidget {
  final String website;
  final String email;
  final String phone;
  final String facebook;
  final String linkedin;
  final String google;
  final String twitter;
  const ContactList(
      {super.key,
      this.website = "https://woparadise.tech",
      this.email = "hr@jobsgo.vn",
      this.phone = "0944150502",
      this.facebook = "Facebook Fanpage",
      this.linkedin = "LinkedIn",
      this.google = "Google+",
      this.twitter = "Twitter"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Contact us',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              contactItem(Icon(Icons.home), website),
              contactItem(Icon(Icons.email), email),
              contactItem(Icon(Icons.phone), phone),
              contactItem(Icon(Icons.facebook), facebook),
              contactItem(Icon(Icons.linked_camera), linkedin),
              contactItem(Icon(Icons.add_circle), google),
              contactItem(Icon(Icons.add_circle), twitter),
            ],
          )
        ],
      ),
    );
  }

  Widget contactItem(icon, text) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: icon,
            ),
            Text(text)
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 1,
          color: AppColor.graylight,
        )
      ]),
    );
  }
}
