
class ForgetPasswordRequest {
  String? code;
  String? password;
  String? confirmPassword;
  String? email;

  ForgetPasswordRequest({this.code, this.password, this.confirmPassword, this.email});

  ForgetPasswordRequest.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    password = json["password"];
    confirmPassword = json["confirmPassword"];
    email = json["email"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["password"] = password;
    _data["confirmPassword"] = confirmPassword;
    _data["email"] = email;
    return _data;
  }
}