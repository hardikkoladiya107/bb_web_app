import '../api_helpers.dart';
import '../request_constant.dart';
import '../response_item.dart';

class MenuRepo {
  MenuRepo._();

  static Future<ResponseItem> getAllMenuItems() async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = '';

    result = await BaseApiHelper.getRequest(
      requestUrl: MethodNames.menu,
      passAuthToken: false,
      queryParam: {
        "type":"MOBILE"
      },
    );
    status = result.status;
    data = result.data;
    message = result.message;
    return ResponseItem(
      data: data,
      message: message,
      status: status,
    );
  }
}
