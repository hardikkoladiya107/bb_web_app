import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

Widget bbDropDown<T>(
    {Widget? child,
    List<MenuItem>? items,
    required Function(MenuItem item) onDropDownTap,
    required BuildContext context,
    bool showDash = false,
    double? width}) {
  List<DropdownMenuItem> children = [];
  children.clear();

  for (int i = 0; i < (items ?? []).length; i++) {
    children.add(
      DropdownMenuItem<MenuItem>(
        value: items?[i],
        onTap: () {
          onDropDownTap(items[i]);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildItem(items![i], context, showDash),
          ],
        ),
      ),
    );
  }

  return DropdownButtonHideUnderline(
    child: DropdownButton2(
      customButton: child,
      items: [...children],
      onChanged: (value) {},
      dropdownStyleData: DropdownStyleData(
        width: width ?? Get.width / 2,
        openInterval: const Interval(0.0, 0.8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        maxHeight: 400,
        elevation: 3,
        offset: const Offset(0,0),
        scrollbarTheme: const ScrollbarThemeData(
          radius: Radius.circular(50),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.zero,
        height: 40,
      ),
    ),
  );
}

Widget buildItem(
  MenuItem item,
  BuildContext context,
  bool showDash,
) {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (item.text ?? "").text(
            textColor: Colors.black,
            fontSize: 16,
          ).paddingOnly(left: 20)
        ],
      )
    ],
  );
}

class MenuItem {
  String? text;
  String? subText;
  int? id;
  bool isSelected;
  String? countryCode;

  int? get idForAPI => text == "Other" ? 0 : id;

  MenuItem({
    this.text,
    this.subText,
    this.id,
    this.countryCode,
    this.isSelected = false,
  });
}
