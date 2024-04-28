import 'package:flutter/foundation.dart';
import 'package:smart_parking_app/ApiManager/Request/ForgetPasswordRequest.dart';
import 'package:smart_parking_app/ApiManager/Response/ForgetPAsswordResponse.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/ForgetPassword/ForgetNavigator.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;

  late ForgetPasswordNavigator navigator;

  ForgetPasswordViewModel(this.repositoryContract);
//Todo function

  ForgetPassword(ForgetPasswordRequestModel forgetPasswordRequest) async {
    navigator.showLoading();

    try {
      var response =
          await repositoryContract.ForgetPassword(forgetPasswordRequest);
      navigator.hideLoading();
      navigator.showMessage("password reset succesfflly");
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString() + "error to reset password");
    }
  }
}
