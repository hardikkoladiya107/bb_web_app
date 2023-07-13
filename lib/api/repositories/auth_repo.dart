import '../api_helpers.dart';
import '../request_constant.dart';
import '../response_item.dart';

class AuthRepo {
  AuthRepo._();

  static Future<ResponseItem> userLogin({
    String? email,
    String? password,
  }) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = '';

    result = await BaseApiHelper.postRequest(
      requestUrl: MethodNames.login,
      requestData: {
        "email": email,
        "password": password,
      },
      passAuthToken: false,
      isMultipart: false,
    );
    status = result.status;
    data = result.body;
    message = result.message;
    return ResponseItem(body: data, message: message, status: status);
  }
}
