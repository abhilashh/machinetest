



import 'package:flutter/cupertino.dart';
import 'package:machinetest/common/routeconstands.dart';
import 'package:machinetest/screens/AccountScreen.dart';
import 'package:machinetest/screens/CartScreen.dart';
import 'package:machinetest/screens/CategoriesScreen.dart';
import 'package:machinetest/screens/MainScreen.dart';
import 'package:machinetest/screens/OffersScreen.dart';

import '../screens/HomeScreen.dart';



class NavRouteGenerator {
static Map<String,WidgetBuilder> generateRoutes ({dynamic? arguments}){
return{
  homeroute:(context) => const HomeScreen(),
  mainpageroute:(context) => const MainScreen(),
  accountroute:(context) => const AccountScreen(),
  categoryroute:(context) => const CategoriesScreen(),
  offerroute:(context) => const OffersScreen(),
  cartroute:(context) => const CartScreen(),
};
}

}