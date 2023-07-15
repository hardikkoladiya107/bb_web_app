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
  List<Menus> rowOneMenuList = [];
  List<Menus> rowTwoMenuList = [];

  Future getAllMenu(BuildContext context) async {
    startLoading();
    ResponseItem response = await MenuRepo.getAllMenuItems();
    if (response.status) {
      menuList.clear();
      menuList.addAll(menuModelFromJson(response.body));
      rowOneMenuList.clear();
      rowTwoMenuList.clear();
      rowOneMenuList.addAll(menuList[0].menus ?? []);
      rowTwoMenuList.addAll(menuList[1].menus ?? []);
      stopLoading();
    } else {
      response.message.errorSnack(context);
      stopLoading();
    }
  }

  Future<void> deleteMenu(Menus menuItem, BuildContext context) async {
    startLoading();
    ResponseItem response = await MenuRepo.deleteMenuItem(menuItem.id ?? "");
    if (response.status) {
      await getAllMenu(context);
      stopLoading();
      response.message.errorSnack(context);
      update(["RowOneBuilder"]);
    } else {
      response.message.errorSnack(context);
      stopLoading();
      update(["RowOneBuilder"]);
    }
  }
}
