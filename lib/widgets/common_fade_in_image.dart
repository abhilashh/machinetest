import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomFadeImage extends StatelessWidget {
  final String? url;
  final String placeHolder;
  final double? height;
  final double? width;
  final BoxFit? boxFit;

  const CustomFadeImage(
      {Key? key,
      @required this.url,
      this.placeHolder = 'assets/image/place_holder.png',
      this.height,
      this.width,
      this.boxFit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      image: url ?? '',
      placeholder: kTransparentImage,
      imageErrorBuilder: (context, _, __) {
        return Container(
          child: Image.asset(placeHolder),
          height: height,
          width: width,
          decoration: const BoxDecoration(
            // color: Color(0xFFD6D6D6),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        );
      },
      height: height,
      width: width,
      fit: boxFit,
    );
  }
}


