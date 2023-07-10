import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Column(
        children: [
          categoryManageMent(),
          filterItem(),
          categoryItemsList(),
        ],
      ),
    );
  }

  Widget categoryManageMent() {
    return Container(
      height: 150,
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    addCategoryButton(),
                  ],
                )
              ],
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

  Widget categoryItemsList() {
    return Container(
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
      child: Column(
        children: [
          categoryTitle(),
          categoryItem(),
          categoryItem(),
          categoryItem(),
        ],
      ),
    ).paddingAll(15);
  }

  Widget categoryTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        categoryTitleChild("SI No"),
        categoryTitleChild("Category Name(Id)."),
        categoryTitleChild("Category Description."),
        categoryTitleChild("Parent Category."),
        categoryTitleChild("Order."),
        categoryTitleChild(""),
      ],
    ).paddingOnly(
      top: 12,
      bottom: 12,
    );
  }

  Widget categoryTitleChild(String s) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          s.text(
            fontSize: 16,
            weight: FontWeight.w600,
          )
        ],
      ),
    );
  }

  Widget categoryItem() {
    return Column(
      children: [
        Container(
          height: 0.8,
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            categoryItemChild("1"),
            categoryItemChild("Air Sports(12B12)"),
            categoryItemChild(
                "The sports inserted above are governinternationally by Fédération Internationale."),
            categoryItemChild("Physical Sports(1234)."),
            categoryItemChild("1"),
            moreIconWidget()
          ],
        ).paddingOnly(
          top: 10,
          bottom: 10,
        )
      ],
    );
  }

  Widget moreIconWidget() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: const Icon(
              Icons.more_vert_outlined,
              size: 20,
            ).center,
          )
        ],
      ),
    );
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

  Widget filterItem() {
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
          Container(
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
          ).paddingAll(5)
        ],
      ),
    ).paddingAll(15);
  }
}
