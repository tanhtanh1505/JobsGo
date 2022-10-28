import 'package:flutter/material.dart';
import 'package:jobsgo/models/user/user.dart';
import 'package:jobsgo/services/user_service.dart';

class Username extends StatefulWidget {
  const Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  @override
  Widget build(BuildContext context) {
    return username();
  }

  Widget username() {
    return FutureBuilder(
      future: UserService.getUserProfile(),
      builder: (BuildContext context, AsyncSnapshot<UserModel> model) {
        if (model.hasData) {
          return Text(
            model.data!.username,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
