import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends StatefulWidget {
  static String id = "card_screen";

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          button(() {
            Get.back();
          }),
        ],
      ),
    );
  }

  Widget button(Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          color: Colors.amberAccent,
          child: Text("Get.back()"),
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
        title: Text("CardScreen"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }
}
