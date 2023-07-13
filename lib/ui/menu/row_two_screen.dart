import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/menu_model.dart';
import '../../widgets/bb_dialog.dart';
import '../../widgets/bb_image.dart';
import '../../widgets/dropdown.dart';
import 'menu_controller.dart';

class RowSecondMenuScreen extends StatelessWidget {
    RowSecondMenuScreen({Key? key}) : super(key: key);

  var controller = Get.find<MenuScreenController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuScreenController>(
      id: "RowTwoBuilder",
      builder: (ctrl) {
        return Column(
          children: [
            filterAddMenuItem(context),
            listHeader(),
            ReorderableListView(
              padding: const EdgeInsets.only(left: 15, right: 15),
              buildDefaultDragHandles: true,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: (ctrl.rowTwoMenuList ?? []).map(
                    (item) {
                  return rowOneListItem(UniqueKey(), context, item);
                },
              ).toList(),
              onReorder: (int start, int current) {
                if (start < current) {
                  int end = current - 1;
                  Menus startItem = ctrl.rowTwoMenuList[start];
                  int i = 0;
                  int local = start;
                  do {
                    ctrl.rowTwoMenuList[local] = ctrl.rowTwoMenuList[++local];
                    i++;
                  } while (i < end - start);
                  ctrl.rowTwoMenuList[end] = startItem;
                } else if (start > current) {
                  Menus startItem = ctrl.rowTwoMenuList[start];
                  for (int i = start; i > current; i--) {
                    ctrl.rowTwoMenuList[i] = ctrl.rowTwoMenuList[i - 1];
                  }
                  ctrl.rowTwoMenuList[current] = startItem;
                }
                controller.update(["RowTwoBuilder"]);
              },
            )
          ],
        );
      },
    );
  }

  Widget rowOneListItem(Key key, BuildContext context, Menus item) {
    return Container(
      key: key,
      child: Container(
        color: Colors.white,
        child: Column(
          key: key,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryItemChild("1"),
                categoryItemChild(item.title ?? ""),
                categoryItemIcon(item.iconUrl ?? ""),
                categoryItemChild(item.order?.toString() ?? ""),
                moreIconWidget(context)
              ],
            ).paddingOnly(
              top: 10,
              bottom: 10,
            )
          ],
        ),
      ).paddingOnly(
        top: 1,
        bottom: 1,
      ),
    );
  }

  Widget moreIconWidget(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: bbDropDown(
              child: const Icon(
                Icons.more_vert_outlined,
                size: 20,
              ).center,
              onDropDownTap: (item) {
                //controller.onPerHourDropDownTap(item);
              },
              width: 100,
              items: controller.allPerHour,
              context: context,
            ),
          )
        ],
      ),
    );
    ;
  }

  Widget categoryItemChild(String s) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: s
                .text(
              fontSize: 14,
              weight: FontWeight.w600,
            )
                .center,
          )
        ],
      ),
    );
  }

  Widget filterAddMenuItem(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          offset: Offset(1, 1),
        ),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          addMenuButton(context),
          filterButton(),
        ],
      ),
    ).paddingAll(15);
  }

  Widget filterButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.orange,
      ),
      width: 150,
      child: Row(
        children: [
          const Icon(
            Icons.filter_list_alt,
            size: 22,
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

  Widget addMenuButton(BuildContext context) {
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
            size: 22,
            color: Colors.white,
          ).paddingOnly(left: 5),
          "Add Menu"
              .text(
            fontSize: 16,
            textColor: Colors.white,
          )
              .paddingOnly(left: 15),
        ],
      ).paddingAll(5),
    ).onClick(() {
      showAddRowOneMenuDialog(context);
    }).paddingAll(5);
  }

  showAddRowOneMenuDialog(BuildContext context) {
    bbDialog(
      context: context,
      horizontalPadding: 16,
      child: addRowOneMenuDialog(),
    ).whenComplete(
          () {
        // Get.find<NonTaxItemDialogController>().whenDialogClose();
      },
    );
  }

  Widget categoryItemIcon(String s) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BBImage.networkImage(
            path: s,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget addRowOneMenuDialog() {
    return Container(
      height: 200,
      width: 200,
    );
  }

  Widget listHeader() {
    return Container(
      key: key,
      child: Container(
        color: Colors.white,
        child: Column(
          key: key,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryItemChild("ID"),
                categoryItemChild("Title"),
                categoryItemChild("Icon"),
                categoryItemChild("Icon"),
                categoryItemChild("Action")
              ],
            ).paddingOnly(
              top: 10,
              bottom: 10,
            )
          ],
        ),
      ).paddingOnly(
        top: 1,
        bottom: 1,
      ),
    ).paddingOnly(left: 15,right: 15);
  }
}