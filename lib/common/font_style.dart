import 'package:flutter/material.dart';
import 'package:machinetest/common/hex_color.dart';

class FontStyle {
  static const themeFont = "SFProDisplay";

  static TextStyle noBorderSearchHint = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: HexColor("#767676"));
  static TextStyle whiteBold = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
  static TextStyle blue13Medium = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w600, color: HexColor("#0B71C2"));
  static TextStyle medium14Black = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: HexColor("#111111"));
  static TextStyle grey14SearchHintMedium = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: HexColor("#727272"));
  static TextStyle homeCategoryTitle = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, color: HexColor('1B1B1B'));
  static TextStyle homeProductCardTitle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: HexColor('#111111'));
  static TextStyle grey14SemiBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: HexColor('#111111'),
  );
  static TextStyle grey12RegularLineThrough = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: HexColor('#767676'),
      decoration: TextDecoration.lineThrough);
  static TextStyle green12Medium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: HexColor('#00A539'),
  );

}
