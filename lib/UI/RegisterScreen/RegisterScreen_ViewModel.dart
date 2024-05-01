import 'package:flutter/material.dart';
import 'package:smart_parking_app/ApiManager/ApiManager.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/RegisterScreen/RegisterNavigator.dart';
import 'package:smart_parking_app/widget/DialogUtils.dart';

class RegisterScreenViewModel extends ChangeNotifier {
// class viewModel to handle logic

  late RegisterNavigator navigator;
  AuthenticationRepositoryContract repositoryContract;

  RegisterScreenViewModel(this.repositoryContract);
  void Register(String name, String phone, String email, String password,
      String confirmpassword) async {
    //loading how to access context ?
    // DialogUtils.showProgress(context, "Loading");
    navigator.showLoading();
    try {
      var response = await repositoryContract.register(
          name, phone, email, password, confirmpassword);

      if (response == null) {
// hide loading

        navigator.hideLoading();
//showMEssage
        navigator.showMessage(response ?? 'error');
      } else {
//hideloading
        navigator.hideLoading();
//showmessage
        navigator.showMessage(response ?? 'Login successfully',
            posActionTitle: 'ok', posAction: () {});

        //  navigator.toHomePage();
      }
    } catch (e) {
//hide loading
      navigator.hideLoading();
      //show message
      navigator.showMessage(e.toString());
    }
  }
}











