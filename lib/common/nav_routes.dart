

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'routeconstands.dart';

class NavRoutes{
  static void navRemoveUntilHomePage(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil(homeroute, (route) => false);
  }

  static void navRemoveUntiMainPage(BuildContext context) {
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil(mainpageroute, (route) => false);
  }
}