import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:machinetest/model/HomeModel.dart';
import 'package:machinetest/widgets/common_fade_in_image.dart';

class HomeBannerHead extends StatelessWidget {
  List<Value>? bannerList;

  HomeBannerHead({Key? key, this.bannerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = bannerList!
        .map((item) => Stack(
              children: [
                InkWell(
                  child: Container(
                    padding:  EdgeInsets.symmetric(horizontal: 11),
                    decoration:BoxDecoration(
                      color:Colors.grey[50],
                      borderRadius:  BorderRadius.all(
                          Radius.circular(20.0)
                      ),
                    ),
                    child: CustomFadeImage(
                      url: '${item.bannerUrl}',
                      boxFit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    ),
                  ),
                  onTap: () {
                  },
                ),
              ],
            ))
        .toList();
    return CarouselSlider(
      items: imageSliders,
      options: CarouselOptions(
        aspectRatio: 2.3,
        viewportFraction: 1,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
        initialPage: 0,
        autoPlay: true,
      ),
    );
  }
}
