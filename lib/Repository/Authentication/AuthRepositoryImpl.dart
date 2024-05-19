import 'package:flutter/material.dart';
import 'package:smart_parking_app/ApiManager/Request/ForgetPasswordRequest.dart';
import 'package:smart_parking_app/ApiManager/Request/PriceRequestModel.dart';
import 'package:smart_parking_app/ApiManager/Response/ForgetPAsswordResponse.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';
// class AuthREpositoryImpl handling response body of class AuthenticationRepositoryContract
class AuthREpositoryImpl implements AuthenticationRepositoryContract {

  AuthReomteDataSource reomteDataSource;
  AuthREpositoryImpl(this.reomteDataSource);

  @override
  Future<String?> login(String email, String password) async {
    var response = await reomteDataSource.login(email, password);
    return response.message;
  }

  @override
  Future<String?> register(String name, String phone, String email, String password, String confirmPassword) async {
    var response = await reomteDataSource.register(
        name, phone, email, password, confirmPassword);
    return response.message;
  }

  @override
  Future<String?> ForgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest) async {
    var response = await reomteDataSource.forgetPassword(forgetPasswordRequest);
    return response.message;
  }

  @override
  Future<String?> ResetByEmail(String email) async {
    var response = await reomteDataSource.ResetByEmail(email);
    return response!.message;
  }

  @override
  Future<String?> CodeCheck(String error)async {
    var response = await reomteDataSource.CodeCheck(error);
    return response!.error;
  }

  @override
  Future<double?>Price(PriceRequestModel priceRequestModel)async {
    var response = await reomteDataSource.Price(priceRequestModel);
    return response.prediction;
  }


}
