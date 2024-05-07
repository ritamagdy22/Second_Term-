import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// Import 'VoidCallback' from 'dart:async'
import 'dart:async';

// Other imports...



import 'package:smart_parking_app/UI/Password&ConfirmPassword/NewPassword_ConfirmPassword.dart';
import 'package:smart_parking_app/UI/RecivingCode/RecivingCodeNavigator.dart';
import 'package:smart_parking_app/UI/RecivingCode/RecivingCodeViewModel.dart';
import 'package:smart_parking_app/widget/Form_Label_Widget.dart';
import 'package:smart_parking_app/widget/custom_Text_FormField.dart';

import '../../Repository/Authentication/AuthenticationRepositoryContract.dart';
import '../../widget/AppBarDetails.dart';
import '../../widget/Custom_Button.dart';
import '../../widget/DialogUtils.dart';

class Recivingcode extends StatefulWidget {
  const Recivingcode({super.key});

  static const RecivingCode = "RecivingCode";

  @override
  State<Recivingcode> createState() => _RecivingcodeState();
}

class _RecivingcodeState extends State<Recivingcode>implements ReceivingCodeNavigator {
  TextEditingController RecivingcodeController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  RecivingCodeViewModel ViewModel = RecivingCodeViewModel(injectAuthRepository());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>ViewModel,
      child: SafeArea(
          child: Scaffold(
              appBar: appBarWidget(context: context),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Verification code",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              )),
                          const SizedBox(
                            height: 12,
                          ),
                          Column(
                            children: [
                              Form(
                                key: formkey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                      width: 10,
                                    ),
                                    FormLabelWidget(
                                        Label:
                                            "Please Enter verification code you have recived  on your Email"),
                                    const SizedBox(
                                      height: 10,
                                      width: 10,
                                    ),
                                    CustomTextFormField(
                                        isPassword: false,
                                        Type: TextInputType.name,
                                        validator: (text) {
                                          if (text == null ||
                                              text.trim().isEmpty) {
                                            return "Please Enter your Name";
                                          } else {
                                            null;
                                            return null;
                                          }
                                        },
                                        controller: RecivingcodeController,
                                        hintText: "Enter verification code"),
                                    const SizedBox(
                                      height: 30,
                                      width: 10,
                                    ),

                                    CustomButton(
                                        title: "Verify",
                                        onPressed: () {
                                          RecivingCodeFunction();

                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ))),
    );
  }



  @override
  void hideLoading() {
    // TODO: I have to implement hideLoading (it's not correct yet )
    Text("hideloading");

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



  void RecivingCodeFunction (){
    if (formkey.currentState!.validate() == false){
      return;
    }else{
      ViewModel.RecivingCodeFunction(RecivingcodeController.text);
    }
  }


}

