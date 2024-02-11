class LoginRequestModel {
  String? login;
  String? password;

  LoginRequestModel({this.login, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['password'] = password;
    return data;
  }
}
