import 'package:flutter/material.dart';
import 'package:jobsgo/models/conversation/conversation.dart';
import 'package:jobsgo/models/employer/employer.dart';
import 'package:jobsgo/screens/Employer/component/avatar_wallpaper.dart';
import 'package:jobsgo/screens/Employer/component/size.dart';
import 'package:jobsgo/services/chat_service.dart';
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
  late ConversationModel conversation;

  @override
  void initState() {
    super.initState();
    getInfoEmployer();
  }

  getInfoEmployer() async {
    EmployerModel? resData = await EmployerService().getEmployer(widget.id);
    ConversationModel conversationModelTemp =
        await ChatService.getConversationWith(widget.id);
    if (resData != null) {
      setState(() {
        employer = resData;
        conversation = conversationModelTemp;

        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
              centerTitle: true,
              iconTheme: IconThemeData(color: AppColor.black),
              title: Text(
                employer.name,
                style: TextStyle(color: AppColor.black),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: body(),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget body() {
    return ListView(
      children: [
        AvatarWallpaper(employer: employer, conversation: conversation),
        paragraph("Introduction", employer.about),
        Container(height: 10, color: AppColor.graylight),
        paragraph("Address", employer.address),
        Container(height: 10, color: AppColor.graylight),
        SizeCompany(size: employer.size),
        Container(height: 10, color: AppColor.graylight),
        ContactList(email: employer.email, phone: employer.phone),
      ],
    );
  }

  Widget paragraph(title, content) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(right: 25, left: 25, top: 16, bottom: 16),
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
}
