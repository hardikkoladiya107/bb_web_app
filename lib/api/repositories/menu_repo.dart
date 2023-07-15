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
      passAuthToken: true,
      queryParam: {"type": "MOBILE"},
    );
    status = result.status;
    data = result.body;
    message = result.message;
    return ResponseItem(
      body: data,
      message: message,
      status: status,
    );
  }

  static Future<ResponseItem> deleteMenuItem(String menuId) async {
    ResponseItem result;
    bool status = true;
    dynamic data;
    String message = '';

    result = await BaseApiHelper.deleteRequest(
      requestUrl: MethodNames.menu,
      passAuthToken: true,
      queryParam: {
        "menu_item_id": menuId,
      },
    );
    status = result.status;
    data = result.body;
    message = result.message;
    return ResponseItem(
      body: data,
      message: message,
      status: status,
    );
  }
}
