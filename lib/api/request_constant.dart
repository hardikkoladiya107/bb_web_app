import 'package:flutter/foundation.dart';

class AppUrls {
  static const String _devBaseURL = "http://dev-1-api.busibeez.com/api";
  static const String _liveBaseURL = "http://dev-1-api.busibeez.com/api";


  static const String baseUrl =
      kDebugMode ? _devBaseURL : _liveBaseURL;
}

class MethodNames {
  static const login = '/authentication/login';

}

class RequestParam {
  static const service = "Service"; // -> pass method name
  static const showError = "show_error"; // -> bool in String
}

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const userAgent = "User-Agent";
  static const appSecret = "App-Secret";
  static const appTrackVersion = "App-Track-Version";
  static const appDeviceType = "App-Device-Type";
  static const appStoreVersion = "App-Store-Version";
  static const appDeviceModel = "App-Device-Model";
  static const appOsVersion = "App-Os-Version";
  static const appStoreBuildNumber = "App-Store-Build-Number";
  static const authToken = "Auth-Token";
  static const accessToken = "Access-Token";
}
