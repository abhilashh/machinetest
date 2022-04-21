
import 'package:flutter/material.dart';
import 'package:machinetest/common/hex_color.dart';
class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final TextStyle? textStyle;
  const CommonButton({Key? key,
    this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.textStyle,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width ?? double.maxFinite, height ?? 31.0),
            primary: HexColor('#199B3B'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
        // onPressed: onPressed,
        onPressed: (){

        },
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyle ?? TextStyle(color: Colors.white),
        ));
  }
}