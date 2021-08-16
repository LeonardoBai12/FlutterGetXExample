import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app_getx/controller/home_controller.dart';
import 'package:new_app_getx/screens/card_screen.dart';

class ShopScreen extends StatefulWidget {
  static String id = "/shop_screen";

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final homeController = Get.find<HomeController>();

  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(homeController.status.value),
          button(() {
            Get.offNamed(CardScreen.id);
          }, "Get.offNamed(CardScreen.id)"),
          button(() {
            Get.back(result: "bao");
          }, "Get.back(result: bao)"),
        ],
      ),
    );
  }
  Widget button(Function() onPressed, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          color: Colors.amberAccent,
          child: Text(text),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ShopScreen"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }
}
