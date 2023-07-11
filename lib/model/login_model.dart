import 'dart:convert';



String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    int? status,
    String? message,
    Body? body,
  }) {
    _status = status;
    _message = message;
    _body = body;
  }

  LoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  int? _status;
  String? _message;
  Body? _body;

  LoginModel copyWith({
    int? status,
    String? message,
    Body? body,
  }) =>
      LoginModel(
        status: status ?? _status,
        message: message ?? _message,
        body: body ?? _body,
      );

  int? get status => _status;

  String? get message => _message;

  Body? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_body != null) {
      map['body'] = _body?.toJson();
    }
    return map;
  }
}

Body bodyFromJson(String str) => Body.fromJson(json.decode(str));

String bodyToJson(Body data) => json.encode(data.toJson());

class Body {
  Body({
    String? token,
    String? email,
    String? userId,
    String? authenticationStatus,
  }) {
    _token = token;
    _email = email;
    _userId = userId;
    _authenticationStatus = authenticationStatus;
  }

  Body.fromJson(dynamic json) {
    _token = json['token'];
    _email = json['email'];
    _userId = json['userId'];
    _authenticationStatus = json['authentication_status'];
  }

  String? _token;
  String? _email;
  String? _userId;
  String? _authenticationStatus;

  Body copyWith({
    String? token,
    String? email,
    String? userId,
    String? authenticationStatus,
  }) =>
      Body(
        token: token ?? _token,
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
