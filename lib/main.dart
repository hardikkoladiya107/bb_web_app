import 'package:bb_web_app/ui/login/login_screen.dart';
import 'package:bb_web_app/utils/app_colors.dart';
import 'package:bb_web_app/utils/routes.dart';
import 'package:bb_web_app/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.init();
  await preferences.putAppDeviceInfo();
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


