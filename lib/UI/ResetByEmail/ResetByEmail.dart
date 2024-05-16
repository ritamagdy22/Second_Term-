import 'package:flutter/material.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/RecivingCode/RecivingCode.dart';
import 'package:smart_parking_app/UI/ResetByEmail/ResetByEmailNavigator.dart';
import 'package:smart_parking_app/UI/ResetByEmail/ResetByEmailViewModel.dart';
import 'package:smart_parking_app/widget/Custom_Button.dart';
import 'package:smart_parking_app/widget/DialogUtils.dart';
import 'package:smart_parking_app/widget/Form_Label_Widget.dart';
import 'package:smart_parking_app/widget/custom_Text_FormField.dart';

class ResetByEmail extends StatefulWidget {
  @override
  State<ResetByEmail> createState() => _ResetByEmailState();
}

class _ResetByEmailState extends State<ResetByEmail>
    implements ResetByEmailNavigator {
  TextEditingController resetByEmailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ResetByEmailViewModel viewModel =
      ResetByEmailViewModel(injectAuthRepository());
  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
              width: 10,
            ),
            FormLabelWidget(Label: "Email Address"),
            const SizedBox(
              height: 20,
              width: 10,
            ),
            Form(
              key: formKey,
              child: CustomTextFormField(
                isPassword: false,
                Type: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return "Please Enter your Email";
                  }
                  var emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(text);
                  if (!emailValid) {
                    return "Email not valid";
                  }
                  return null;
                },
                controller: resetByEmailController,
                hintText: "Please Enter Your Email",
              ),
            ),
            const SizedBox(
              height: 30,
              width: 20,
            ),
            CustomButton(
              title: "Send",
              onPressed: () {
                resetByEmailFunction();
              },
            ),
            const SizedBox(
              height: 20,
              width: 20,
            ),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Recivingcode()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    DialogUtils.showProgress(context, "");
  }

  @override
  void showMessage(
    String message, {
    String? posActionTitle,
    String? negActionTitle,
    VoidCallback? posAction,
    VoidCallback? negAction,
    bool isDismissible = true,
  }) {
    DialogUtils.showMessage(
      context,
      message,
      isDismissible: isDismissible,
      negAction: negAction,
      posAction: posAction,
      posActionTitle: posActionTitle,
    );
  }

  @override
  void showLoading() {
    DialogUtils.showProgress(context, "Loading");
  }

  void resetByEmailFunction() {
    if (formKey.currentState!.validate() == false) {
      return;
    } else {
      viewModel.resetByEmailFunction(resetByEmailController.text);
    }
  }
}
