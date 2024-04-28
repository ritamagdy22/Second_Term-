import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_parking_app/ApiManager/Request/ForgetPasswordRequest.dart';
import 'package:smart_parking_app/ApiManager/Response/ForgetPAsswordResponse.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/Password&ConfirmPassword/ForgetNavigator.dart';
import 'package:smart_parking_app/UI/Password&ConfirmPassword/ForgetViewModel.dart';
import 'package:smart_parking_app/UI/LoginScreen/LoginScreen.dart';
import 'package:smart_parking_app/widget/DialogUtils.dart';
import 'package:smart_parking_app/widget/Form_Label_Widget.dart';
import 'package:smart_parking_app/widget/custom_Text_FormField.dart';

class ForgetPasswordByEmail extends StatefulWidget {
  ForgetPasswordByEmail({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordByEmail> createState() => _ForgetPasswordByEmailState();
}

class _ForgetPasswordByEmailState extends State<ForgetPasswordByEmail>
    implements ForgetPasswordNavigator {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ForgetPasswordViewModel viewModel =
      ForgetPasswordViewModel(injectAuthRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    Size screenSize = mediaQuery.size;

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
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
          padding: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Please enter the code you have received to reset your password",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FormLabelWidget(Label: "New Password"),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  Type: TextInputType.visiblePassword,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please enter a new password";
                    }
                    if (text.length < 6) {
                      return "Password must be at least 6 characters long";
                    }
                    return null;
                  },
                  controller: newPasswordController,
                  hintText: "New Password",
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FormLabelWidget(Label: "Confirm New Password"),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  Type: TextInputType.visiblePassword,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "Please confirm your new password";
                    }
                    if (text != newPasswordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  hintText: "Confirm New Password",
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  onPressed: () {
                    ForgetPassword();
                    if (formKey.currentState!.validate()) {
                      // Form is valid, proceed with password reset
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Verify',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
    print("hideloading");
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

  void ForgetPassword() {
    if (formKey.currentState!.validate()) {
      final model = ForgetPasswordRequestModel(
        //   email: ,git
        //   code:  ,
        confirmPassword: newPasswordController.text,
        //    password: ,
      );
      viewModel.ForgetPassword(model);
    }
  }
}
