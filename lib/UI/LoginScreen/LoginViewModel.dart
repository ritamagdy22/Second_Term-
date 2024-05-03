import 'package:flutter/material.dart';
import 'package:smart_parking_app/ApiManager/ApiManager.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/LoginScreen/LoginNavigator.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;
  late LoginNavigator navigator;

  LoginViewModel(
    this.repositoryContract,
  );
  Login(String email, String password) async {
    navigator.showLoading();
    try {
      var response = await repositoryContract.login(email, password);
      navigator.hideLoading();
      navigator.showMessage("Login successfully");
      //hideloading
      //showmessage
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString() + " Error in login");
      //throw (e);
    }
  }
}
