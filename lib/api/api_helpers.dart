import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bb_web_app/api/request_constant.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../utils/app_constant.dart';
import '../utils/app_utils.dart';
import '../utils/routes.dart';
import 'api_exception.dart';
import 'response_item.dart';

class BaseApiHelper {
  static Future<ResponseItem> getRequest({
    required String requestUrl,
    required Map<String, dynamic> queryParam,
    required bool passAuthToken,
  }) async {
    dio = Dio();
    return await dio
        .get(
        AppUrls.baseUrl + requestUrl,
          queryParameters: queryParam,
          options: Options(headers: AppUtils.requestHeader(passAuthToken)),
        )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }

  static Future<ResponseItem> postRequest({
    required String requestUrl,
    required Map<String, dynamic> requestData,
    required bool passAuthToken,
    bool isMultipart = false,
  }) async {
    dio = Dio();
    FormData? formData;
    if (isMultipart) {
      formData = FormData.fromMap(requestData);
    }
    return await dio
        .post(
          AppUrls.baseUrl + requestUrl,
          data: isMultipart ? formData : json.encode(requestData),
          options: Options(headers: AppUtils.requestHeader(passAuthToken)),
        )
        .then((value) => onValue(value))
        .onError((error, stackTrace) => onError(error));
  }

  static Future onValue(Response response) async {
    log(response.requestOptions.method, name: 'REQUEST_METHOD');
    log(response.requestOptions.path, name: 'REQUEST_URL');
    log(json.encode(response.requestOptions.queryParameters),
        name: 'REQUEST_PARAMS');
    log(json.encode(response.requestOptions.headers), name: 'REQUEST_HEADERS');
    if ((response.requestOptions.contentType ?? 'application/json') ==
        'application/json') {
      log(response.requestOptions.data, name: 'REQUEST_DATA');
    } else {
      var logData = {};
      for (var element in (response.requestOptions.data as FormData).fields) {
        logData[element.key] = element.value;
      }
      log(json.encode(logData), name: 'REQUEST_DATA');
    }
    log(json.encode(response.data), name: 'RESPONSE');
    final ResponseItem responseData = ResponseItem.fromJson(response.data);
    bool status = false;
    String message;
    dynamic data;

    if (response.statusCode == 200) {
      message = responseData.message;
      if (responseData.status) {
        status = true;
        data = responseData.data;
        data ??= response.data;
      } else {
        if (responseData.forceLogout!) {
          box.erase();
          box.write(AppConstant.isTutorialDone, true);

          await getx.Get.offNamedUntil(Routes.login, (route) => false,
              arguments: false);
        }
      }
    } else {
      message = AppConstant.errorText;
    }
    ResponseItem result = ResponseItem(
      data: data,
      message: message,
      status: status,
    );
    result.wholeData = response.data;
    result.isEmailSent = responseData.isEmailSent;

    return result;
  }

  static onError(error) {
    log('Error caused: $error');
    bool status = false;
    String message = 'Unsuccessful request';
    if (error is SocketException) {
      message = ResponseException('No internet connection').toString();
    } else if (error is FormatException) {
      message = ResponseException('Something wrong in response.').toString() +
          error.toString();
    }
    return ResponseItem(data: null, message: message, status: status);
  }
}
