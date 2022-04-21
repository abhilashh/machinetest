import 'package:flutter/material.dart';
import 'package:machinetest/common/color_palette.dart';


class ReUseAble {

  static Widget circularLoader({double? height, double? width}) {
    return Container(
      alignment: Alignment.center,
      height: height ?? double.maxFinite,
      width: width ?? double.maxFinite,
      child: CircularProgressIndicator(
        strokeWidth: 4.0,
        valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primaryColor),
      ),
    );
  }
}