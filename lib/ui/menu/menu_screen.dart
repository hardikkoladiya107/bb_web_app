import 'package:bb_web_app/ui/menu/menu_controller.dart';
import 'package:bb_web_app/ui/menu/row_one_screen.dart';
import 'package:bb_web_app/ui/menu/row_two_screen.dart';
import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);

  var controller = Get.put(MenuScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: GetBuilder<MenuScreenController>(
        builder: (ctrl) {
          return SingleChildScrollView(
            child: Column(
              children: [
                categoryManageMent(),
                rowMenu(),
                menuBody(ctrl),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget menuBody(MenuScreenController ctrl) {
    return IndexedStack(
      index: ctrl.drawerCount,
      children:   [
        RowOneMenuScreen(),
        RowSecondMenuScreen(),
      ],
    );
  }

  Widget rowMenu() {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Column(
            children: [
              "Row 1 Menu".text().paddingAll(15),
              controller.drawerCount == 0
                  ? Container(
                      height: 3,
                      width: 90,
                      color: Colors.red,
                    )
                  : Container()
            ],
          ).onClick(() {
            controller.drawerCount = 0;
            controller.update();
          }),
          Column(
            children: [
              "Row 2 Menu".text().paddingAll(15),
              controller.drawerCount == 1
                  ? Container(
                      height: 3,
                      width: 90,
                      color: Colors.red,
                    )
                  : Container()
            ],
          ).onClick(() {
            controller.drawerCount = 1;
            controller.update();
          }),
        ],
      ),
    ).paddingOnly(left: 15, right: 15);
  }

  Widget categoryManageMent() {
    return Container(
      height: 130,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: Container()),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
            ),
          )
        ],
      ),
    ).paddingAll(15);
  }

  Widget addCategoryButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.orange,
      ),
      width: 150,
      child: Row(
        children: [
          const Icon(
            Icons.add,
            size: 20,
            color: Colors.white,
          ).paddingOnly(left: 5),
          "Filter"
              .text(
                fontSize: 16,
                textColor: Colors.white,
              )
              .paddingOnly(left: 15),
        ],
      ).paddingAll(5),
    ).paddingAll(5);
  }
}
