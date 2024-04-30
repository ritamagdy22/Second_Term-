import 'package:flutter/material.dart';
import 'package:smart_parking_app/ApiManager/Request/RequestCode.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/ResetByEmail/ResetByEmail.dart';
import 'package:smart_parking_app/UI/ResetByEmail/ResetByEmailNavigator.dart';

class ResetByEmailViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;

  late ResetByEmailNavigator navigator;
  ResetByEmailViewModel(this.repositoryContract);

  ResetByEmail(RequestCodeModel requestCodeModel) async {
    navigator.showLoading();

    try {
      var response = await repositoryContract.ResetByEmail(requestCodeModel);

      navigator.hideLoading();
      navigator.showMessage("Code sent to your email to reset your password");
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString() + "error to send code ");
    }
  }
}
