import 'package:http/http.dart';
import 'package:smart_parking_app/ApiManager/ApiManager.dart';
import 'package:smart_parking_app/ApiManager/Request/ForgetPasswordRequest.dart';
import 'package:smart_parking_app/ApiManager/Request/RequestCode.dart';
import 'package:smart_parking_app/ApiManager/Response/ForgetPAsswordResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/LoginResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/RegisterResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/ResponseCode.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthenticationRepositoryContract.dart';

//this class have  implentation of the methods in class AuthenticationRepositoryContract
class AuthRemoteDataSourceImpl implements AuthReomteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    var response = await apiManager.login(email, password);
    return response;
  }

  @override
  Future<RegisterResponseModel> register(String name, String phone,
      String email, String password, String confirmPassword) async {
    var response = await apiManager.register(
        name, phone, email, password, confirmPassword);
    return response;
  }

  @override
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest) async {
    var response = await apiManager.ForgetPassword(forgetPasswordRequest);
    return response;
  }
//Facing error in implemintation
  
  @override
  Future<String?> ResetByEmail(RequestCodeModel requestCodeModel) {
    // TODO: implement ResetByEmail
    throw UnimplementedError();
  }
}

//ToDo Function ResetPassword

AuthReomteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(injectApiManager());
}

ApiManager injectApiManager() {
  return ApiManager();
}

/*
class AuthReomteDataSource having special method of 
injectAuthRemoteDataSource return class AuthRemoteDataSourceImpl that have injectApiManager
what is injectApiManager ? 
it's a method created to call apimanger class methods 
*/