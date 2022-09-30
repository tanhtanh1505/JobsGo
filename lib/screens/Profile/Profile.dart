import 'package:flutter/material.dart';
import 'package:jobsgo/services/shared_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextButton(
            onPressed: () => SharedService.logout(context),
            child: const Text(
              'Logout',
            ),
          ),
        ]),
      ),
    );
  }
}
