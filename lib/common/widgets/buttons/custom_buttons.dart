import 'package:flutter/material.dart';
import 'package:grammarlyclone/common/config/colors.dart';
import 'package:grammarlyclone/common/widgets/texts/custom_text_style.dart';

Widget customButton({
  required String buttonText,
  required Function() onPressed,
  Color? backgroundColor,
  Color? textColor,
  double? width,
  double? height,
  EdgeInsetsGeometry? padding,
  double? borderRadius,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.all(0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(backgroundColor ?? null),
          minimumSize:
              MaterialStatePropertyAll(Size(width ?? 50, height ?? 50)),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8)))),
      child: Text(
        style: TextStyle(color: textColor ?? null),
        buttonText,
      ),
    ),
  );
}

Widget customGreenButton({
  required String buttonText,
  required Function() onPressed,
  Color? backgroundColor,
  Color? textColor,
  double? width,
  double? height,
  EdgeInsetsGeometry? padding,
  double? borderRadius,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.all(0),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(backgroundColor ?? customGreenColor),
          minimumSize: MaterialStatePropertyAll(
            Size(width ?? 50, height ?? 60),
          ),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8)))),
      child: customText(
        text: buttonText,
        color: textColor,
      ),
    ),
  );
}

Widget customWhiteButton({
  required String buttonText,
  required Function() onPressed,
  Color? backgroundColor,
  Color? textColor,
  double? width,
  double? height,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(backgroundColor ?? customWhiteColor),
        minimumSize: MaterialStatePropertyAll(Size(width ?? 50, height ?? 60)),
        side: MaterialStatePropertyAll(
            BorderSide(width: 2, color: customGreyLight))),
    child: customText(
      text: buttonText,
      color: textColor,
    ),
  );
}
