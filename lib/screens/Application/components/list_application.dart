import 'package:flutter/material.dart';
import 'package:jobsgo/component/application_card.dart';
import 'package:jobsgo/models/application/application.dart';
import 'package:jobsgo/services/application_service.dart';

class ListApplication extends StatefulWidget {
  const ListApplication({super.key});

  @override
  State<ListApplication> createState() => _ListApplicationState();
}

class _ListApplicationState extends State<ListApplication> {
  bool isLoaded = false;
  List<ApplicationModel> listApplications = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    var temp = await ApplicationService().getListApplication();
    setState(() {
      listApplications = temp;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? buildListApplication()
        : const CircularProgressIndicator();
  }

  Widget buildListApplication() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        itemCount: listApplications.length,
        itemBuilder: (context, index) {
          return ApplicationCard(application: listApplications[index]);
        },
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
      ),
    );
  }
}
