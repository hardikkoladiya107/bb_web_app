import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());
class LoginModel {
  LoginModel({
      String? token,
      String? email,
      String? userId,
      String? authenticationStatus,}){
    _token = token;
    _email = email;
    _userId = userId;
    _authenticationStatus = authenticationStatus;
}

  LoginModel.fromJson(dynamic json) {
    _token = json['token'];
    _email = json['email'];
    _userId = json['userId'];
    _authenticationStatus = json['authentication_status'];
  }
  String? _token;
  String? _email;
  String? _userId;
  String? _authenticationStatus;
LoginModel copyWith({  String? token,
  String? email,
  String? userId,
  String? authenticationStatus,
}) => LoginModel(  token: token ?? _token,
  email: email ?? _email,
  userId: userId ?? _userId,
  authenticationStatus: authenticationStatus ?? _authenticationStatus,
);
  String? get token => _token;
  String? get email => _email;
  String? get userId => _userId;
  String? get authenticationStatus => _authenticationStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['email'] = _email;
    map['userId'] = _userId;
    map['authentication_status'] = _authenticationStatus;
    return map;
  }

}