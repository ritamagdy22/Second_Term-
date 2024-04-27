import 'package:smart_parking_app/ApiManager/Response/ForgetPAsswordResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/LoginResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/RegisterResponse.dart';
import 'package:smart_parking_app/Repository/Authentication/AuthRepositoryImpl.dart';
import 'package:smart_parking_app/Repository/DataSource/AuthRemoteDataSourceImplemintation.dart';

//abstract class have methods without body
abstract class AuthenticationRepositoryContract {
// why we need it ? to be able to use with any diffrent pacakge http or dio
  Future<String?> register(String name, String phone, String email,
      String password, String confirmPassword);

  Future<String?> login(String email, String password);

  // ToDo : Method ForgetPasswordByEmail
  Future<String?> ForgetPassword(String NewPassword, String ConfirmNewPassword);
}

// another abstarct calss preparing the data from model class
abstract class AuthReomteDataSource {
  Future<RegisterResponse> register(String name, String phone, String email,
      String password, String confirmPassword);
  Future<LoginResponse> login(String email, String password);

  // ToDo Method : ForgetPasswordByEmail
  Future<ForgetPasswordResponse> forgetPassword(
      String newPass, String confrimNewPass);
}

AuthenticationRepositoryContract injectAuthRepository() {
  return AuthREpositoryImpl(injectAuthRemoteDataSource());
}

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
