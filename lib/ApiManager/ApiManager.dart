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
  Future<RegisterResponse> register(String name, String phone, String email,
      String password, String confirmPassword) async {
    Uri url = Uri.parse(ApiConstants.BaseURl + ApiConstants.SignupApi);

    var requestBody = RegisterRequest(
      name: name,
      password: password,
      email: email,
      confirmPassword: confirmPassword,
      phone: phone,
    );

    var response = await http.post(
      url,
      body: json.encode(requestBody.toJson()),
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
      return RegisterResponse.fromJson(responseData);
    } else if (response.statusCode == 400) {
      // Error response, parse the error message
      var responseData = jsonDecode(responseString);
      var errorMessage = responseData['message'];

      if (errorMessage == 'user already exist') {
        // Handle case where user already exists
        return RegisterResponse(message: 'User already exists');
      } else {
        // Handle other error messages
        return RegisterResponse(message: errorMessage);
      }
    } else {
      // Handle other status codes
      return RegisterResponse(message: 'Unexpected error occurred');
    }
  }

  Future<LoginResponse> login(String email, String password) async {
    var url = Uri.parse(ApiConstants.BaseURl + ApiConstants.LoginApi);
    var requestbody = LoginRequest(email: email, password: password);
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
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  Future<ForgetPasswordResponse> ForgetPassword(
      String NewPassword, String ConfirmNewPassword) async {
    var url = Uri.parse(ApiConstants.BaseURl + ApiConstants.ForgetPasswordApi);
    var requestbody = ForgetPasswordRequest(
        //Todo (question about response)
        code: "",
        password: NewPassword,
        confirmPassword: ConfirmNewPassword,
        email: '');
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

    return ForgetPasswordResponse.fromJson(jsonDecode(response.body));
  }
}


/*


import 'dart:convert';

import 'package:smart_parking_app/ApiManager/ApiConstants/ApiConstants.dart';
import 'package:http/http.dart' as http;
import 'package:smart_parking_app/ApiManager/Request/RegisterRequest.dart';
import 'package:smart_parking_app/ApiManager/Response/RegisterResponse.dart';

class ApiMaanger {
  static Future<RegisterResponse> Register(String name, String phone,
      String email, String password, String confirmpassword) async {
      Uri url = Uri.parse(ApiConstants.BaseURl + ApiConstants.SignupApi);
    //Uri url = Uri.http(ApiConstants.BaseURl, ApiConstants.SignupApi);
// calling Register response body

    var RequestBody = RegisterRequest(
        name: name,
        password: password,
        email: email,
        confirmPassword: confirmpassword,
        phone: phone);

    // we are just handling request and response from server in json as dart use json

    var response = await http.post(url, body: RequestBody.toJson());
    // returning RegisterResponse from model class that we have created
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }
}

*/
