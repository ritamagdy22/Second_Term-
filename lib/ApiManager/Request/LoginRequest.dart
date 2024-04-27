
class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }

  Map<String, String> toJson() {
    final Map<String, String> _data = <String, String>{};
    _data["email"] = email ?? '';
    _data["password"] = password ?? '';
    return _data;
  }
}