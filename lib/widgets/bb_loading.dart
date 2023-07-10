import 'dart:ui';

import 'package:bb_web_app/widgets/extensions/cmn_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget LoadingStack(GestureTapCallback? onOutSideClick) {
  return Stack(
    alignment: Alignment.center,
    children: [
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Container(
          color: Colors.black.withOpacity(0.40),
        ),
      ),
      const SpinKitDualRing(
        color: Colors.pink,
        lineWidth: 5,
        duration: Duration(milliseconds: 500),
        size: 40.0,
      )
    ],
  ).onClick(
    onOutSideClick ?? () {},
  );
}
