import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/responsive.dart';
import '../category/category_screen.dart';
import '../feed/feed_screen.dart';
import '../menu/menu_screen.dart';
import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Responsive(
          mobile: mobileScreen(),
          desktop: destTopScreen(),
        ),
      ),
    );
  }

  Widget destTopScreen() {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Row(
          children: [
            Container(
              width: 300,
              color: bgColor,
              child: Column(
                children: [
                  "Admin"
                      .text(
                        textColor: Colors.white,
                        fontSize: 30,
                        weight: FontWeight.w500,
                      )
                      .paddingOnly(top: 20),
                  sideBarItem(lable: "Feeds", isSelected: ctrl.drawerCount == 0)
                      .paddingOnly(top: 65)
                      .onClick(
                    () {
                      ctrl.drawerCount = 0;
                      controller.update();
                    },
                  ),
                  sideBarItem(
                          lable: "Category", isSelected: ctrl.drawerCount == 1)
                      .onClick(() {
                    ctrl.drawerCount = 1;
                    controller.update();
                  }),
                  sideBarItem(lable: "Menu", isSelected: ctrl.drawerCount == 2)
                      .onClick(() {
                    ctrl.drawerCount = 2;
                    controller.update();
                  }),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: ctrl.drawerCount,
                children: const [
                  FeedScreen(),
                  CategoryScreen(),
                  MenuScreen(),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget sideBarItem({String? lable, bool isSelected = false}) {
    return Container(
      color: isSelected ? bgColorDark : Colors.transparent,
      child: Row(
        children: [
          Container(
            height: 55,
            width: 5,
            color: isSelected ? Colors.white : bgColor,
          ),
          lable
              .text(
                textColor: Colors.white,
                fontSize: 18,
                style: FontStyle.italic,
                weight: FontWeight.w500,
              )
              .paddingOnly(
                left: 50,
              ),
        ],
      ),
    );
  }

  Widget mobileScreen() {
    return Container();
  }
}
