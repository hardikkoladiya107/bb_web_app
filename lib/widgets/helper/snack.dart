import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../bb_text.dart';

enum SnackType { success, error }

SnackbarController showAppSnackBar(
  String tittle, {
  SnackType type = SnackType.success,
}) {
  return Get.showSnackbar(
    GetSnackBar(
      maxWidth: 450,
      messageText: bbTextCommen(tittle,
          color: Colors.white,
          fontsize: 16,
          weight: FontWeight.w500,
          align: TextAlign.start),
      borderRadius: 15,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shouldIconPulse: false,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      backgroundColor:
          type == SnackType.success ? success.withOpacity(0.6) : failed,
      duration: const Duration(seconds: 3),
    ),
  );
}

extension extForSnack on String? {
  errorSnack(BuildContext context) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: failed,
          content: text(
            textColor: Colors.white,
            fontSize: 16,
            weight: FontWeight.w500,
          ),
        ),
      );
    } catch (e) {
      e.debugPrint;
    }
  }

  successSnack(BuildContext context) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: text(
            textColor: Colors.white,
            fontSize: 16,
            weight: FontWeight.w500,
          ),
        ),
      );
    } catch (e) {
      e.debugPrint;
    }
  }
}
