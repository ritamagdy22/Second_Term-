import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:smart_parking_app/UI/Password&ConfirmPassword/NewPassword_ConfirmPassword.dart';
import 'package:smart_parking_app/UI/RecivingCode/RecivingCodeNavigator.dart';
import 'package:smart_parking_app/UI/RecivingCode/RecivingCodeViewModel.dart';
import 'package:smart_parking_app/widget/custom_Text_FormField.dart';

import '../../Repository/Authentication/AuthenticationRepositoryContract.dart';
import '../../widget/AppBarDetails.dart';
import '../../widget/Custom_Button.dart';
import '../../widget/DialogUtils.dart';

class Recivingcode extends StatefulWidget {
  const Recivingcode({super.key, required this.email});

  final String? email;

  static const RecivingCode = "RecivingCode";

  @override
  State<Recivingcode> createState() => _RecivingcodeState();
}


class _RecivingcodeState extends State<Recivingcode>implements ReceivingCodeNavigator {
  TextEditingController RecivingcodeController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  RecivingCodeViewModel ViewModel =
      RecivingCodeViewModel(injectAuthRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel,
      child: SafeArea(
        child: Scaffold(
          appBar: appBarWidget(context: context),
          body: Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Verification code",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextFormField(
                            isPassword: false,
                            Type: TextInputType.name,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return "Please Enter code";
                              } else {
                                return null;
                              }
                            },
                            controller: RecivingcodeController,
                            hintText: "Enter verification code",
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            title: "Verify",
                            onPressed: () {
                              RecivingCodeFunction();
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Password_and_ConfirmPassword(
                                              email: widget.email),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    DialogUtils.showProgress(context, "Loading");
  }

  @override
  void showMessage(String message,
      {String? posActionTitle,
      String? negActionTitle,
      VoidCallback? posAction,
      VoidCallback? negAction,
      bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
        isDismissible: isDismissible,
        negAction: negAction,
        posAction: posAction,
        posActionTitle: posActionTitle);
  }

  @override
  Future<void> navigate() async {
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Password_and_ConfirmPassword(email: widget.email),
        ));
  }

  void RecivingCodeFunction() {
    if (formkey.currentState!.validate() == false) {
      return;
    } else {
      ViewModel.RecivingCodeFunction(RecivingcodeController.text);
    }
  }
}
