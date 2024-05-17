import 'package:smart_parking_app/ApiManager/Request/ForgetPasswordRequest.dart';
import 'package:smart_parking_app/ApiManager/Request/PriceRequestModel.dart';
import 'package:smart_parking_app/ApiManager/Response/CodeCheckResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/ForgetPAsswordResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/LoginResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/PriceResponseModel.dart';
import 'package:smart_parking_app/ApiManager/Response/RegisterResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/ResponseCode.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthRepositoryImpl.dart';
import 'package:smart_parking_app/Repository/DataSource/AuthRemoteDataSourceImplemintation.dart';

abstract class AuthenticationRepositoryContract {
/*
Abstract class having methods and type of parameters w
 */
  Future<String?> register(String name, String phone, String email,
      String password, String confirmPassword);
  Future<String?> login(String email, String password);
  Future<String?> ForgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest);
  Future<String?> ResetByEmail(String email);
  Future<String?>CodeCheck(String error);
  //Todo LastAPI (price)
  Future<double?>Price(PriceRequestModel priceRequestModel);
}

// another abstarct calss preparing the data from model class
abstract class AuthReomteDataSource {
  Future<RegisterResponseModel> register(String name, String phone, String email, String password, String confirmPassword);
  Future<LoginResponseModel> login(String email, String password);
  Future<ResponseCodeModel?> ResetByEmail(String email);
  Future<CodeCheckResponse?> CodeCheck(String error);
  // ToDo Method : ForgetPasswordByEmail
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest);
  Future<PriceResponseModel>Price(
      PriceRequestModel priceRequestModel );

}

AuthenticationRepositoryContract injectAuthRepository() {
  return AuthREpositoryImpl(injectAuthRemoteDataSource());

  /*
dependency injection : 
we made function named (injectAuthRepository) from class type AuthenticationRepositoryContract
return AuthREpositoryImpl ( which is have all implemintation of the methods )
and updated injectAuthRemoteDataSource 
بالبلدي بي retrun 
function that we did on class (AuthRemoteDataSourceImpl)
AuthReomteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(injectApiManager());
}
ApiManager injectApiManager() {
  return ApiManager();
}


*/
}
