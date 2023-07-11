import 'dart:io';
import '../api/request_constant.dart';
import 'app_constant.dart';

class AppUtils {
  static Map<String, String> requestHeader(bool passAuthToken) {
    return {
      RequestHeaderKey.contentType: 'application/json',
      RequestHeaderKey.appSecret: 'freeme123',
      RequestHeaderKey.appTrackVersion: 'v1',
      // RequestHeaderKey.appDeviceType: Platform.isIOS ? 'iOS' : 'android',
      if (passAuthToken)
        RequestHeaderKey.authToken: box.read(AppConstant.authToken) ?? '',
      if (passAuthToken)
        RequestHeaderKey.accessToken: box.read(AppConstant.accessToken) ?? '',
    };
  }
}
