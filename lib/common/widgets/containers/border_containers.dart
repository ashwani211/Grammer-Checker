import 'package:flutter/material.dart';
import 'package:grammarchecker/common/config/colors.dart';

Widget customBorderContainer({
  double? width,
  double? height,
  Widget? child,
  Color? borderColor,
  double? borderRadius,
  double? padding,
  double? margin,
}) {
  return Container(
    width: width,
    height: height,
    margin: EdgeInsets.all(padding??20),
    padding: EdgeInsets.all(padding??4),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: borderColor?? customGreyLight,
      ),
      borderRadius: BorderRadius.circular(borderRadius??8),
    ),
    child: child,
  );
}
