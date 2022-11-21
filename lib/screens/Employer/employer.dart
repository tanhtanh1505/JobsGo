import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jobsgo/component/appbar_custom.dart';
import 'package:jobsgo/component/avatar_widget.dart';
import 'package:jobsgo/models/employer/employer.dart';
import 'package:jobsgo/screens/Employer/component/size.dart';
import 'package:jobsgo/screens/Message/component/chat_area.dart';
import 'package:jobsgo/services/employer_service.dart';
import 'package:jobsgo/themes/styles.dart';

import 'component/contact_list.dart';

class Employer extends StatefulWidget {
  const Employer({super.key, required this.id});
  final String id;

  @override
  State<Employer> createState() => _EmployerState();
}

class _EmployerState extends State<Employer> {
  late EmployerModel employer;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getInfoEmployer();
  }

  getInfoEmployer() async {
    EmployerModel? resData = await EmployerService().getEmployer(widget.id);
    if (resData != null) {
      setState(() {
        employer = resData;
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColor.black),
            title: Text(
              'Employer',
              style: TextStyle(color: AppColor.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: body()),
    );
  }

  Widget body() {
    return ListView(
      children: [
        Container(
          child: wallpaperAndAvatar(),
        ),
        paragraph("Address", employer.address),
        SizeCompany(size: employer.size),
        const ContactList()
      ],
    );
  }

  Widget paragraph(title, content) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(content)
        ],
      ),
    );
  }

  Widget wallpaperAndAvatar() {
    return Column(
      children: [
        Container(
          height: 175,
          decoration: BoxDecoration(
            color: AppColor.bluel2,
            image: DecorationImage(
              image: NetworkImage(employer.wallpaper),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        AvatarWidget(
          width: 80,
          height: 80,
          urlImage: employer.avatar,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            employer.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: const Text(
            "Job service, Application and etc...",
            style: TextStyle(fontSize: 13),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColor.blue,
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 12, left: 12)),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatArea(reciever: employer),
              ),
            ),
            child: Text(
              'Contact',
              style: TextStyle(color: AppColor.white),
            ),
          ),
        )
      ],
    );
  }
}
