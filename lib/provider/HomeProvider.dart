
import 'package:flutter/material.dart';
import 'package:machinetest/common/helpers.dart';
import 'package:machinetest/model/HomeModel.dart';
import 'package:machinetest/service/service_config.dart';



class HomeProvider extends ChangeNotifier{
  ServiceConfig serviceConfig = ServiceConfig();
  HomeModel? homeModel;
  LoadState pageLoadState = LoadState.loaded;
  void homeInit() {
    pageLoadState = LoadState.loading;
    notifyListeners();
  }
  Future<void>gethomeData() async{
    updatePageLoadState(LoadState.loading);
    final network =await Helpers.isInternetAvailable();
    if(network){
      homeModel = await serviceConfig.getHomeData();
      updatePageLoadState(LoadState.loaded);
      notifyListeners();
    }
    else{
      updatePageLoadState(LoadState.networkError);
    }
  }
  void updatePageLoadState(LoadState val) {
    pageLoadState = val;
    notifyListeners();
  }




}