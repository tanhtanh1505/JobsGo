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
      padding: const EdgeInsets.only(left: 25, right: 25, top: 16, bottom: 16),
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
              contactItem(const Icon(Icons.home_outlined), website),
              contactItem(const Icon(Icons.email_outlined), email),
              contactItem(const Icon(Icons.phone_outlined), phone),
              contactItem(const Icon(Icons.facebook_outlined), facebook),
              contactItem(const Icon(Icons.linked_camera_outlined), linkedin),
              contactItem(const Icon(Icons.g_mobiledata), google),
              contactItem(const Icon(Icons.add_circle), twitter),
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
            Text(text),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(size: 15, Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
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
