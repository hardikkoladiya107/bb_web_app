import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/responsive.dart';
import '../../widgets/bb_button.dart';
import '../../widgets/bb_textfield.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: Responsive(
          mobile: mobileScreen(),
          desktop: destTopScreen(),
        ),
      ),
    );
  }

  Widget destTopScreen() {
    return Stack(
      children: [
        ...topBottomDesign(size: 600),
        Column(
          children: [
            Row(),
            bbLogo(height: 300, width: 300).paddingOnly(top: 20),
            _userName(),
            _password(),
            _button(),
          ],
        )
      ],
    );
  }

  List<Widget> topBottomDesign({required double size}) {
    return [
      SizedBox(
        height: size,
        width: size,
        child: Image.asset(
          Assets.iconsTopRight,
          fit: BoxFit.cover,
        ),
      ).positioned(right: 0),
      SizedBox(
        height: size,
        width: size,
        child: Image.asset(
          Assets.iconsBottomLeft,
          fit: BoxFit.cover,
        ),
      ).positioned(left: 0, bottom: 0),
    ];
  }

  Widget mobileScreen() {
    return Stack(
      children: [
        ...topBottomDesign(size: 350),
        Column(
          children: [
            Row(),
            bbLogo(
              width: 200,
              height: 200,
            ).paddingOnly(top: 45),
            _userName(),
            _password(),
            _button(),
          ],
        )
      ],
    );
  }

  Widget bbLogo({required double width, required double height}) {
    return Image.asset(
      Assets.iconsBbLogo,
      height: height,
      width: width,
    );
  }

  Widget _userName() {
    return Container(
      height: 45,
      width: 350,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: BBTextField(
        hint: "USERNAME",
        textColor: Colors.white,
        hintColor: Colors.white,
        prefixIcon: Image.asset(
          Assets.iconsUser,
          height: 24,
          width: 24,
        ).paddingAll(8),
      ),
    ).paddingOnly(top: 40);
  }

  Widget _password() {
    return Container(
      width: 350,
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: BBTextField(
        hint: "PASSWORD",
        hintColor: Colors.white,
        textColor: Colors.white,
        prefixIcon: Image.asset(
          Assets.iconsLock,
          height: 23,
          width: 23,
        ).paddingAll(8),
      ).center,
    ).paddingOnly(top: 20);
  }

  Widget _button() {
    return Container(
      width: 355,
      child: AppButton(
        buttonColor: buttonColor,
        text: "LOGIN",
        onPress: () {},
        borderValue: 0,
      ),
    ).paddingOnly(top: 40);
  }
}

//$NAME$
