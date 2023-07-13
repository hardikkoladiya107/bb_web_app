import 'package:bb_web_app/widgets/helper/snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/repositories/auth_repo.dart';
import '../../api/response_item.dart';
import '../../model/login_model.dart';
import '../../utils/app_constant.dart';
import '../../utils/routes.dart';

class LoginController extends GetxController {

  bool showPassword = false;

  void showHidePassword() {
    showPassword = !showPassword;
    update();
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  startLoading() {
    isLoading = true;
    update();
  }

  stopLoading() {
    isLoading = false;
    update();
  }

  Future<void> performLogin(BuildContext context) async {
    if (_isValidate()) {
      startLoading();
      ResponseItem response = await AuthRepo.userLogin(
        email: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (response.status) {
        LoginModel responseData = LoginModel.fromJson(response.body);
        await setupLoginData(responseData);
        stopLoading();
        Get.toNamed(Routes.mainScreen);
      } else {
        response.message.errorSnack(context);
        stopLoading();
      }
    }
  }


  String? userError;
  String? passwordError;

  bool _isValidate() {
    if (userNameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        (!userNameController.text.trim().isEmail)) {
      if (userNameController.text.trim().isEmpty) {
        userError = "Enter e-mail";
      } else {
        if (!userNameController.text.trim().isEmail) {
          userError = "Enter Valid e-mail";
        } else {
          userError = null;
        }
      }
      if (passwordController.text.trim().isEmpty) {
        passwordError = "Enter password";
      } else {
        passwordError = null;
      }
      update();
      return false;
    }
    userError = null;
    passwordError = null;
    update();
    return true;
  }

  Future<void> setupLoginData(LoginModel loginModel) async {
    await box.write(AppConstant.authToken, loginModel.token);
    await box.write(AppConstant.isLogin, true);
    await box.write(AppConstant.userProfile, loginModel.toJson());
  }

}
