class ForgetPasswordResponse {
  String? message;
  String? stack;

  ForgetPasswordResponse({this.message, this.stack});

  ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    stack = json["stack"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["stack"] = stack;
    return _data;
  }
}
