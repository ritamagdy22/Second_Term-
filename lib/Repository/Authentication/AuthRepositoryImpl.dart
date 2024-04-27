import 'package:flutter/material.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';

class AuthREpositoryImpl implements AuthenticationRepositoryContract {
  AuthReomteDataSource reomteDataSource;
  AuthREpositoryImpl(this.reomteDataSource);

  @override
  Future<String?> login(String email, String password) async {
    var response = await reomteDataSource.login(email, password);
    return response.message;
  }

  @override
  Future<String?> register(String name, String phone, String email,
      String password, String confirmPassword) async {
    var response = await reomteDataSource.register(
        name, phone, email, password, confirmPassword);
    return response.message;
  }
  
  @override
  Future<String?> ForgetPassword(String NewPassword, String ConfirmNewPassword)async {
    // TODO: implement ForgetPassword
    var response = await reomteDataSource.forgetPassword(NewPassword, ConfirmNewPassword);
    return response.message;
  }
}
