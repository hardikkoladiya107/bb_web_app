import 'package:bb_web_app/widgets/helper/snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api/repositories/menu_repo.dart';
import '../../api/response_item.dart';
import '../../model/menu_model.dart';
import '../../widgets/dropdown.dart';

class MenuScreenController extends GetxController {
  int? drawerCount = 0;

  List<MenuItem> allPerHour = [
    MenuItem(text: "Edit"),
    MenuItem(text: "Delete")
  ];

  changeCount(int index) {
    drawerCount = index;
    update();
  }

  bool isLoading = false;

  startLoading() {
    isLoading = true;
    update();
  }

  stopLoading() {
    isLoading = false;
    update();
  }

  List<MenuModel> menuList = [];

  Future getAllMenu(BuildContext context) async {
    startLoading();
    ResponseItem response = await MenuRepo.getAllMenuItems();
    if (response.status) {
      menuList.clear();
      menuList.addAll(menuModelFromJson(response.data));
      stopLoading();
    } else {
      response.message.errorSnack(context);
      stopLoading();
    }
  }
}
