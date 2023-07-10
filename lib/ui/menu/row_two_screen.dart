import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class RowSecondMenuScreen extends StatelessWidget {
  const RowSecondMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      filterItem()
    ],);
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