import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app_getx/screens/shop_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button(() {
            getSnackbar();
          }, "getSnackbar()"),
          button(() {
            getDialog();
          }, "getDialog()"),
          button(() {
            getBottomSheet();
          }, "getBottomSheet()"),
                    button(() {
            Get.toNamed(ShopScreen.id, arguments: "zika");
          }, "Get.toNamed(ShopScreen.id)"),
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

  void getDialog() {
    Get.defaultDialog(
      title: "Are you sure?",
      content: Text("You will be fired"),
      textConfirm: "CONFIRM",
      textCancel: "CANCEL",
    );
  }

  void getBottomSheet() {
    Get.bottomSheet(Text("aaaa"));
  }

  void getSnackbar() {
    Get.snackbar(
      "isso é uma snackbar",
      "nao sei pra que serve mas ta aqui",
      icon: Icon(
        Icons.check,
        color: Colors.black,
      ),
      backgroundColor: Colors.amber,
      mainButton: TextButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.black,
          child: Text(
            "MY CART",
            style: TextStyle(
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WelcomeScreen"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }
}
