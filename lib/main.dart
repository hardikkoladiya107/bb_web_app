import 'package:bb_web_app/ui/login/login_screen.dart';
import 'package:bb_web_app/utils/app_colors.dart';
import 'package:bb_web_app/utils/app_constant.dart';
import 'package:bb_web_app/utils/routes.dart';
import 'package:bb_web_app/utils/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
 // await preferences.putAppDeviceInfo();
  await GetStorage.init();
  box = GetStorage();
  dio = Dio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BB Web App',
      getPages: Routes.pages,
      home: LoginScreen(),
    );
  }
}


