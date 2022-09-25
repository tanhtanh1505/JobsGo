import 'package:flutter/material.dart';
import 'package:jobsgo/MyHomePage.dart';
import 'package:jobsgo/config.dart';
import 'package:jobsgo/models/login_request_model.dart';
import 'package:jobsgo/services/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late String username;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProgressHUD(
      key: UniqueKey(),
      inAsyncCall: isApiCallProcess,
      child: Form(key: globalFormKey, child: _loginUI(context)),
    ));
  }

  Widget _loginUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormHelper.inputFieldWidget(context, "Username", "Username",
            (onValidateVal) {
          if (onValidateVal.isEmpty) {
            return "Username can\t be empty";
          }
          return null;
        }, (onSavedVal) {
          username = onSavedVal;
        }),
        FormHelper.inputFieldWidget(
          context,
          "Password",
          "Password",
          (onValidateVal) {
            if (onValidateVal.isEmpty) {
              return "Password can\t be empty";
            }
            return null;
          },
          (onSavedVal) {
            password = onSavedVal;
          },
        ),
        FormHelper.submitButton("Login", () {
          if (validateAndSave()) {
            setState(() {
              isApiCallProcess = true;
            });

            LoginRequestModel model =
                LoginRequestModel(username: username, password: password);

            APIService.login(model).then((response) {
              setState(() {
                isApiCallProcess = false;
              });
              if (response) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              } else {
                FormHelper.showSimpleAlertDialog(context, Config.appName,
                    "Invalid username or password", "Ok", () {
                  Navigator.pop(context);
                });
              }
            });
          }
        })
      ],
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
