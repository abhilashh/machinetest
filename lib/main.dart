import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machinetest/screens/MainScreen.dart';
import 'package:provider/provider.dart';

import 'common/nav_route_generator.dart';
import 'common/provider_child_widget.dart';
import 'common/routeconstands.dart';

void main() async {
  runApp(const Fluttertest());
}

class Fluttertest extends StatelessWidget {
  const Fluttertest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderHelperClass.instance.providerLists,
      child: MaterialApp(
        title: 'Flutter Test',
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
        initialRoute: initialroute,
        routes: NavRouteGenerator.generateRoutes(),
        theme: ThemeData(
            primarySwatch: Colors.red,
            fontFamily: 'Inter',
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                iconTheme: IconThemeData(color: Colors.black)),
            brightness: Brightness.light,
            textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black)),
      ),
    );
  }
}

