

import 'package:flutter/material.dart';
import 'package:machinetest/common/hex_color.dart';
import 'package:machinetest/model/HomeModel.dart';
import 'package:machinetest/widgets/common_fade_in_image.dart';
import 'package:machinetest/common/font_style.dart';

import 'commonButton.dart';

class ProductList extends StatelessWidget {
  final BuildContext? cxt;
  final List<Value>? products;

  const ProductList({
    Key? key,
    this.products,
    this.cxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildProductList(context);
  }
  _buildProductList(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products!.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.only(
                left: i == 0 ? 12 : 0,
                right: (products?.length ?? 0) - 1 == i ? 12 : 0),
            child: ProductTile(
              length: products!.length,
              index: i,
              product: products![i],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 8.0);
        },
      ),
    );
  }
}
class ProductTile extends StatelessWidget {
  int? index;
  int? length;
  Value? product;

  ProductTile(
      {Key? key,
        this.index,
        this.length,
        this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        // height: 285,
        width: 158,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(color: HexColor("#FFEAEAEA"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopWidgets(context),
            _buildImageWidget(),
            if(product!.isExpress == true)
            _buildBuyWidget(),
            if(product!.offerPrice != product!.actualPrice)
            _buildPriceOfferWidget(),
            _buildPriceWidget(),
            _buildTitleWidget(),
            _buildAddTo(),
          ],
        ),
      ),
      onTap:(){

      },
    );
  }

  _buildTopWidgets(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(product!.offer! > 0)
          Container(
              margin: EdgeInsets.only(top: 10),
              height: 15,
              width: 51,
              color: Colors.red,
              child: Center(
                child: Text('${(product!.offer).toString()}% off',style:FontStyle.whiteBold ,),
              )),
          InkWell(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  'assets/image/fav.png',
                  key: UniqueKey(),
                  height: 19,
                  width: 19,
                )
              ),
            ),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
  _buildImageWidget() {
    return Expanded(
        child: Padding(
          child: CustomFadeImage(
            placeHolder: 'assets/image/place_holder_product.png',
            url: product!.image ?? '',
            boxFit: BoxFit.contain,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        ));
  }
  _buildBuyWidget(){
    return Container(
      margin: EdgeInsets.only( left: 12),
      height: 14,
      width: 21,
      decoration: BoxDecoration(
        color: HexColor("#FFCB01") ,
        borderRadius:  BorderRadius.all(
            Radius.circular(2.0)
        ),
      ),

      child: Center(
        child: Icon(
          Icons.delivery_dining_outlined ,
          size: 13,
        ),
      ),
    );

  }
  _buildTitleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 2, right: 11, left: 11),
      child: Text(product!.name!,
          maxLines: 1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: FontStyle.homeProductCardTitle),
    );
  }
  _buildPriceWidget() {
    return Container(
      margin: EdgeInsets.only(top: 2, right: 11, left: 11),
      child: Text(product!.offerPrice??"",
          maxLines: 1,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          style: FontStyle.grey14SemiBold),
    );
  }

  _buildPriceOfferWidget() {
    return Container(
        margin: EdgeInsets.only(right: 11, left: 12,top: 2),
        child: Row(
          children: [
            Text(product!.actualPrice??"",
                textAlign: TextAlign.start,
                maxLines: 1,
                style: FontStyle.grey12RegularLineThrough),
          ],
        ));
  }

  _buildAddTo(){
    return Container(
      margin: EdgeInsets.only(top: 8, right: 12, left: 12,bottom: 8),
      child: CommonButton(title: 'ADD',),

    );

  }

}


