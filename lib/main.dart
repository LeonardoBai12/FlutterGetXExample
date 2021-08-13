import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app_getx/screens/card_screen.dart';
import 'package:new_app_getx/screens/shop_screen.dart';
import 'package:new_app_getx/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      defaultTransition: Transition.downToUp,
      initialRoute: WelcomeScreen.id,
      getPages: [
        GetPage(name: WelcomeScreen.id, page: () => WelcomeScreen()),
        GetPage(name: ShopScreen.id, page: () => ShopScreen()),
        GetPage(name: CardScreen.id, page: () => CardScreen()),
      ],
    );
  }
}
