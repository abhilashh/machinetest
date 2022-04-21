import 'package:flutter/material.dart';
import 'package:machinetest/screens/AccountScreen.dart';
import 'package:machinetest/screens/CartScreen.dart';
import 'package:machinetest/screens/CategoriesScreen.dart';
import 'package:machinetest/screens/OffersScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../common/color_palette.dart';
import '../common/hex_color.dart';
import '../common/nav_route_generator.dart';
import '../common/nav_routes.dart';
import '../common/routeconstands.dart';
import 'HomeScreen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PersistentTabController _controller;
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex:  0);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Future<bool> onWillPop() {
      int initialPage =  0;
      if (initialPage == 0) {
        DateTime now = DateTime.now();
        return Future.value(true);
      } else {
        NavRoutes.navRemoveUntiMainPage(context);
      }
      return Future.value(false);
    }
    return PersistentTabView.custom(
      context,
      controller: _controller,
      screens: _buildScreens(),
      confineInSafeArea: true,
      itemCount: 5,
      backgroundColor: ColorPalette.primaryColor,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      hideNavigationBar: false,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      customWidget: WillPopScope(
        child: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
            // getInitialDataByIndex();
          },
          selectedIndex: _controller.index,
        ),
        onWillPop: onWillPop,
      ),
    );
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: 20,
          color: _controller.index == 0
              ? HexColor('#000000')
              : HexColor('#7B7B7B'),
        ),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: initialroute,
          routes: NavRouteGenerator.generateRoutes(),
        ),
        title: 'Home',
        activeColorPrimary: ColorPalette.primaryColor,
        inactiveColorPrimary: ColorPalette.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.apps_rounded,
          size: 20,
          color: _controller.index == 1
              ? HexColor('#000000')
              : HexColor('#7B7B7B'),
        ),
        title: 'Categories',
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: initialroute,
          routes: NavRouteGenerator.generateRoutes(),
        ),
        activeColorPrimary: ColorPalette.primaryColor,
        inactiveColorPrimary: ColorPalette.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.percent_rounded,
          size: 20,
          color: _controller.index == 2
              ? HexColor('#000000')
              : HexColor('#7B7B7B'),
        ),
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: initialroute,
          routes: NavRouteGenerator.generateRoutes(),
        ),
        title: 'Offers',
        activeColorPrimary: ColorPalette.primaryColor,
        inactiveColorPrimary: ColorPalette.black,
      ),
      PersistentBottomNavBarItem(
        icon: Stack(
          children: [
            Icon(
              Icons.shopping_cart,
              size: 20,
              color: _controller.index == 3
                  ? HexColor('#000000')
                  : HexColor('#7B7B7B'),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 14,
              ),
              child:Container(
                  height: 10,
                  width: 10,
                  //padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor('#C40000'),
                  ),
                  alignment: Alignment.center,
                  child:
                  // Consumer<AppDataProvider>(builder: (context, model, _) {
                  //   String count = model.cartCount == null
                  //       ? '0'
                  //       : '${model.cartCount}';
                  //   // String count = model.cartModel?.totalQty == null
                  //   //     ? '0'
                  //   //     : '${model.cartModel?.totalQty}';
                  //   return
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(0.80),
                      child: Text(
                        "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
            )

          ],
        ),
        title: 'Cart',
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: initialroute,
          routes: NavRouteGenerator.generateRoutes(),
        ),
        activeColorPrimary: ColorPalette.primaryColor,
        inactiveColorPrimary: ColorPalette.black,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.person_outline,
          size: 20,
          color: _controller.index == 4
              ? HexColor('#000000')
              : HexColor('#7B7B7B'),
        ),
        title: 'Account',
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: initialroute,
          routes: NavRouteGenerator.generateRoutes(),
        ),
        activeColorPrimary: ColorPalette.primaryColor,
        inactiveColorPrimary: ColorPalette.black,
      ),

    ];
  }
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CategoriesScreen(),
      const OffersScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];
  }
}
class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border:
          Border(top: BorderSide(width: 1, color: HexColor('#EFEFEF')))),
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? item.activeColorPrimary
                      : item.inactiveColorPrimary),
              child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                    item.title!,
                    style: item.textStyle,
                  )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body : Container(
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              int index = items.indexOf(item);
              return Flexible(
                child: InkWell(
                  onTap: () {
                    onItemSelected(index);
                  },
                  child: _buildItem(item, selectedIndex == index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
