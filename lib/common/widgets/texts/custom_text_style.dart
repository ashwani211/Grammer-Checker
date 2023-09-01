import 'package:flutter/material.dart';
import 'package:grammarchecker/common/config/colors.dart';

Widget customHeadingText({
  required String text,
  double? fontSize,
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    textAlign:  textAlign,
    style: TextStyle(
      fontSize: fontSize?? 24,
      color: color?? customGreyColor,
      fontWeight: fontWeight?? FontWeight.bold,
      fontFamily: "Roboto",
    ),
  );
}

Widget customText({
  required String text,
  double? fontSize,
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize?? 18,
      color: color,
      fontWeight: fontWeight,
      fontFamily: "Roboto",
    ),
  );
}

Widget customSmallText({
  required String text,
  double? fontSize,
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize??14,
      color: color??customGreyColor,
      fontWeight: fontWeight?? FontWeight.w500,
      fontFamily: "Roboto",
    ),
  );
}

Widget customBlueButtomText({
  required String text,
  double? fontSize,
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      color: color?? customWhiteColor,
      fontWeight: fontWeight?? FontWeight.w500,
      fontFamily: "Roboto",
    ),
  );
}

Widget customWhiteButtomText({
  required String text,
  double? fontSize,
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      color: color?? customGreyColor,
      fontWeight: fontWeight?? FontWeight.bold,
      fontFamily: "Roboto",
    ),
  );
}
