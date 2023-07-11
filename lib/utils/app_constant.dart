import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'app_string.dart';


late Dio dio;
late GetStorage box;
bool forceLogout = false;


class AppConstant {
  AppConstant._();

  static const isLogin = 'isLogin';
  static const userProfile = 'userProfile';
  static const authToken = 'Auth-Token';


  static const deviceInfoBox = 'deviceInfoBox';
  static const userLoginData = 'userLoginData';
  static const userToken = 'userToken';
  static const isTutorialDone = 'isTutorialDone';
  static const isWelcomeDialogDone = 'isWelcomeDialogDone';
  static const isSocialLogin = 'isSocialLogin';
  static const appStoreVersion = 'App-Store-Version';
  static const appDeviceModel = 'App-Device-Model';
  static const appOsVersion = 'App-Os-Version';
  static const appStoreBuildNumber = 'App-Store-Build-Number';

  static const accessToken = 'Access-Token';
  static const awsBucketName = 'yur-invtd-test';



  static String errorText = somethingWentWrong;

}
