import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_parking_app/ApiManager/ApiConstants/ApiConstants.dart';
import 'package:http/http.dart' as http;
import 'package:smart_parking_app/ApiManager/Request/ForgetPasswordRequest.dart';
import 'package:smart_parking_app/ApiManager/Request/LoginRequest.dart';
import 'package:smart_parking_app/ApiManager/Request/RegisterRequest.dart';
import 'package:smart_parking_app/ApiManager/Response/ForgetPAsswordResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/LoginResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/RegisterResponse.dart';
import 'package:smart_parking_app/ApiManager/Response/ResponseCode.dart';
import 'package:smart_parking_app/UI/ResetByEmail/ResetByEmail.dart';

import 'Request/RequestCode.dart';

class HttpClient {
  static Future<dynamic> post(String url, {Map? data}) async {
    return http.post(
      Uri.parse(url),
      body: data != null ? json.encode(data) : null,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  static Future<dynamic> patch(String url, {Map? data}) async {
    return http.post(
      Uri.parse(url),
      body: data != null ? json.encode(data) : null,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}

class ApiManager {
  /*
  preparing registerresponse function by handling (future await and async)
  sending ot's parameters and using URI 
  (uniform resource identifier which is responsible to get data from internet
    and calling api baseurl with endpoint in it's parameters )
    then saving registerrequest class ( json to dart and dart to json )
    and sending it's parameters 
  */
  Future<RegisterResponseModel> register(String name, String phone,
      String email, String password, String confirmPassword) async {
    Uri url = Uri.parse(ApiConstants.BaseURl + ApiConstants.SignupApi);
    var requestBody = RegisterRequestModel(
      name: name,
      password: password,
      email: email,
      confirmPassword: confirmPassword,
      phone: phone,
    );
    var response = await http.post(
      /*
      Using the required method POST to be saved in response variable 
      While we used  : Uri url = Uri.parse(ApiConstants.BaseURl + ApiConstants.SignupApi);
      we send it in post body and sending json decode 
      */
      url,
      body: json.encode(requestBody.toJson()),
      // as we recived data in row format we are using header to handle it
      headers: {
        'Content-Type': 'application/json',
      },
    );

    final responseString = response.body;
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${requestBody.toJson()}');
    debugPrint('> response: [${response.statusCode}] ${responseString}');
    if (response.statusCode == 200) {
      // Successful response, parse the JSON
      var responseData = jsonDecode(responseString);
      return RegisterResponseModel.fromJson(responseData);
    } else if (response.statusCode == 400) {
      // Error response, parse the error message
      var responseData = jsonDecode(responseString);
      var errorMessage = responseData['message'];
      if (errorMessage == 'user already exist') {
        // Handle case where user already exists
        return RegisterResponseModel(message: 'User already exists');
      } else {
        // Handle other error messages
        return RegisterResponseModel(message: errorMessage);
      }
    } else {
      // Handle other status codes
      return RegisterResponseModel(message: 'Unexpected error occurred');
    }
  }

  Future<LoginResponseModel> login(String email, String password) async {
    var url = Uri.parse(ApiConstants.BaseURl + ApiConstants.LoginApi);
    var requestbody = LoginRequestModel(email: email, password: password);
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${requestbody.toJson()}');
    var response = await http.post(
      url,
      body: json.encode(requestbody.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('> response: [${response.statusCode}] ${response.body}');
    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }
    return LoginResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<ResponseCodeModel> ResetByEmail(String email) async {
    var url = Uri.parse(ApiConstants.BaseURl + ApiConstants.RequestCode);
    var requestbody = RequestCodeModel(email: email);
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${requestbody.toJson()}');
    var response = await http.patch(
      url,
      body: json.encode(requestbody.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('> response: [${response.statusCode}] ${response.body}');
    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }
    return ResponseCodeModel.fromJson(jsonDecode(response.body));
  }
  Future<ForgetPasswordResponseModel> ForgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest) async {
    var url = Uri.parse(ApiConstants.BaseURl + ApiConstants.ForgetPasswordApi);
    debugPrint('> path: ${url.toString()}');
    debugPrint('> body: ${forgetPasswordRequest.toJson()}');
    var response = await http.post(
      url,
      body: json.encode(forgetPasswordRequest.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    debugPrint('> response: [${response.statusCode}] ${response.body}');
    if (response.statusCode != 200) {
      throw Exception(
          jsonDecode(response.body)?['message'] ?? 'Error occurred!');
    }

    return ForgetPasswordResponseModel.fromJson(jsonDecode(response.body));
  }
}
