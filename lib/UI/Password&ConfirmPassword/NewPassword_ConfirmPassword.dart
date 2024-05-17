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

class Password_and_ConfirmPassword extends StatefulWidget {
  Password_and_ConfirmPassword({Key? key, required this.email}) : super(key: key);
  static const PasswordAndConfirmPassword = "Password_and_ConfirmPassword";

  final String? email;


  @override
  State<Password_and_ConfirmPassword> createState() =>
      _Password_and_ConfirmPasswordState();
}

class _Password_and_ConfirmPasswordState
    extends State<Password_and_ConfirmPassword>
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
                    backgroundColor: Colors.black,
                    disabledBackgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  onPressed: () {
                    SetNewPassword();
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
    print("");
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

  void SetNewPassword() {
    if (formKey.currentState!.validate()) {
      final model = ForgetPasswordRequestModel(
        //ToDo
           email:widget.email,
          //ToDo
            confirmPassword: newPasswordController.text,
            password: newPasswordController.text,
      );
      viewModel.ForgetPassword(model);
    }
  }
}
