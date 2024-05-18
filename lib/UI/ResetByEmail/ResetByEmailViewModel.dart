import 'package:flutter/material.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
import 'package:smart_parking_app/UI/ResetByEmail/ResetByEmail.dart';
import 'package:smart_parking_app/UI/ResetByEmail/ResetByEmailNavigator.dart';

class ResetByEmailViewModel extends ChangeNotifier {
  AuthenticationRepositoryContract repositoryContract;

  late ResetByEmailNavigator navigator;

  String? _email;


  String? get email => _email;

  ResetByEmailViewModel(this.repositoryContract);
  resetByEmailFunction(String email) async {
    _email = null;
    navigator.showLoading();
    try {
      var response = await repositoryContract.ResetByEmail(email);
      navigator.hideLoading();
      navigator.showMessage("Code sent to your email to reset your password");
      await Future.delayed(const Duration(milliseconds: 1200));
      navigator.navigate();

      _email = email;
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString() + " error to send code ");

    }
  }
}
