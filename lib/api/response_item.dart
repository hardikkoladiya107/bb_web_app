class ResponseItem {
  ResponseItem({
    this.body,
    this.wholeData,
    required this.message,
    required this.status,
    this.forceLogout,
    this.requestCancelled,
    this.newAuthToken,
    this.verifyCode,
    this.isEmailSent  = false
  });

  dynamic body;
  dynamic wholeData;
  String message;
  bool status;
  bool? forceLogout = false;
  bool? requestCancelled = false;
  String? newAuthToken;
  String? verifyCode;
  bool isEmailSent;

  factory ResponseItem.fromJson(Map<String, dynamic> json) {
    return ResponseItem(
      body: json["body"],
      message: json["message"],
      status: json["status"] == 200 || json["status"] == 201,
      forceLogout: json["force_logout"] == 1,
      requestCancelled: json["request_cancelled"],
      newAuthToken: json["new_token"],
      verifyCode: json["verify_code"],
      isEmailSent: json["isEmailSent"]== 1,
    );
  }

  Map<String, dynamic> toJson() => {
        "body": body,
        "msg": message,
        "status": status,
        "force_logout": forceLogout,
        "request_cancelled": requestCancelled,
        "new_token": newAuthToken
      };
}
