import 'package:flutter/foundation.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/ForgetPassword/ForgetNavigator.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;

  late ForgetPasswordNavigator navigator;

  ForgetPasswordViewModel(this.repositoryContract);
//Todo function

  ForgetPassword(String NewPassword, String ConfirmNewPassword) async {
    navigator.showLoading();

    try {
      var response = await repositoryContract.ForgetPassword(
          NewPassword, ConfirmNewPassword);
      navigator.hideLoading();
      navigator.showMessage("password reset succesfflly");
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString() + "error to reset password");
    }
  }
}
