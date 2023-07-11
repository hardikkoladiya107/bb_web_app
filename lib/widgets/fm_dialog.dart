import 'package:flutter/material.dart';

Future bbDialog(
    {required BuildContext context,
    required Widget child,
    double? horizontalPadding,
    Border? border}) {
  return showDialog(
    context: context,
    /* barrierDismissible: false,*/
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      insetPadding: horizontalPadding != null
          ? EdgeInsets.only(
              left: horizontalPadding,
              right: horizontalPadding,
              bottom: 0,
            )
          : EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: border),
        child: child,
      ),
    ),
  );
}
