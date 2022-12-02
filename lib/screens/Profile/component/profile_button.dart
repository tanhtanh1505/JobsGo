import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jobsgo/services/cv_service.dart';
import 'package:jobsgo/themes/styles.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore_for_file: file_names

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key? key,
    required this.text,
    required this.asset,
    this.goto,
    this.onClick,
  }) : super(key: key);

  final String text, asset;
  final Widget? goto;
  final Function? onClick;

  //final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 22, right: 22, bottom: 3),
      child: TextButton(
        onPressed: () async {
          if (key == const Key('profile_button_cv')) {
            Logger().i('CV button pressed');
            await launchUrl(
              Uri.parse(
                  "https://jobsgo-storage.s3.ap-southeast-1.amazonaws.com/files/638a0d020a30f4200c865d8c"),
            );
          }
          if (text == 'Generate CV') {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Generate CV?'),
                content: const Text('Your CV will be generated!'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.pop(context, 'OK');
                      String url = await CvService().genCv();
                      Logger().d(url);
                      Fluttertoast.showToast(
                          msg: "Your CV are created!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green.shade500,
                          textColor: AppColor.white,
                          fontSize: 15.0);
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
          onClick != null
              ? onClick!()
              : (goto != null
                  ? Navigator.push(
                      context, MaterialPageRoute(builder: (context) => goto!))
                  : null);
        },
        child: Row(
          children: [
            Image.asset(asset),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
