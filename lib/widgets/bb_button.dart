import 'package:flutter/material.dart';
import 'bb_text.dart';

class AppButton extends StatelessWidget {
  final Function() onPress;
  final double height;
  final double borderValue;
  final String? text;
  final bool visible;
  final Color? buttonColor;
  final Widget? widget;

  const AppButton({
    Key? key,
    required this.onPress,
    this.visible = false,
    required this.borderValue,
    this.height = 50,
    this.buttonColor,
    this.widget,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderValue),
        color: buttonColor ?? buttonColor,
      ),
      child: ElevatedButton(
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor ?? buttonColor),
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderValue),
          )),
        ),
        onPressed: () {
          onPress();
        },
        child: Center(
          child: widget ??
              bbTextCommen(
                text ?? "",
                fontsize: 15.5,
                color: Colors.white,
                weight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
