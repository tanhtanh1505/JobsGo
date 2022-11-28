import 'package:flutter/material.dart';
import 'package:jobsgo/component/avatar_widget.dart';
import 'package:jobsgo/models/conversation/conversation.dart';
import 'package:jobsgo/models/employer/employer.dart';
import 'package:jobsgo/screens/Message/component/chat_area.dart';
import 'package:jobsgo/themes/styles.dart';

class AvatarWallpaper extends StatelessWidget {
  const AvatarWallpaper(
      {super.key, required this.employer, required this.conversation});

  final EmployerModel employer;
  final ConversationModel conversation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 175,
          decoration: BoxDecoration(
            color: AppColor.bluelight,
            image: DecorationImage(
              image: NetworkImage(employer.wallpaper),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 175,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Stack(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              child: Text(
                                employer.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
                              margin: const EdgeInsets.only(top: 10),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: AppColor.blue,
                                    padding: const EdgeInsets.only(
                                        top: 0,
                                        bottom: 0,
                                        right: 12,
                                        left: 12)),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChatArea(
                                      conversation: conversation,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Contact',
                                  style: TextStyle(color: AppColor.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  FractionalTranslation(
                    translation: const Offset(0.0, -0.4),
                    child: Align(
                      alignment: const FractionalOffset(0.5, 0.0),
                      child: AvatarWidget(
                        urlImage: employer.avatar,
                        height: 80,
                        width: 80,
                        backgroundColor: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(height: 10, color: AppColor.graylight),
      ],
    );
  }
}
