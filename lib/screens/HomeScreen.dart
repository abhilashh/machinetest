

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machinetest/common/hex_color.dart';
import 'package:machinetest/model/HomeModel.dart';
import 'package:machinetest/provider/HomeProvider.dart';
import 'package:machinetest/service/service_config.dart';
import 'package:machinetest/widgets/home_category_tile.dart';
import 'package:machinetest/widgets/home_top_banner.dart';
import 'package:machinetest/widgets/product_list.dart';
import 'package:machinetest/widgets/reuseable_widget.dart';
import 'package:machinetest/widgets/search_bar.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    fetchInitialData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
      backgroundColor: Colors.white,
      body:Consumer<HomeProvider>(builder: (context,model,_){
        if(model.pageLoadState == LoadState.loading)
          return ReUseAble.circularLoader();
        if(model.pageLoadState == LoadState.loaded){
          List<Value>? category;
          List<Value>? banners;
          List<Value>? products;
          List<HomeDatum>? homeData = model.homeModel!.homeData;
          if(homeData!=null){
            for(int i =0; i<homeData.length;i++){
              if(homeData[i].type=='category'){
                category = homeData[i].values;
              }else if(homeData[i].type=='banners'){
                banners = homeData[i].values;
              }else if(homeData[i].type=='products'){
                products =  homeData[i].values;
              }
            }
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeCategoryTile(categoryList: category,),
                HomeBannerHead(bannerList: banners,),
                ProductList(products: products)
              ],),

          );
        }
        return Container();

      },
      )
    );
  }
  appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 115, // Set this height
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        double _height = constraints.maxHeight;
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: _height * 0.25),
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.0, 2.0, 12.0, _height * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: _height * 0.03,
                ),
                SearchBar(
                    needPadding: false,
                    wrapWithAppBar: false,
                    height: _height * 0.30,
                    isReadOnly: true,
                    onTap: () {
                    }),
                // SizedBox(
                //   height: 5.0.h,
                // ),
              ],
            ),
          ),
        );
      }),
    );
  }
  void fetchInitialData() {
    Future.microtask(() => context.read<HomeProvider>()
      ..homeInit()
      ..gethomeData());
  }
}

