import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_app_getx/controller/home_controller.dart';
import 'package:new_app_getx/screens/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = "/welcome_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.find<HomeController>();
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();

  Widget buildBody() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: emailController,
                onChanged: (value) {},
              ),
            ),
            button(() {
              //if(GetUtils.isEmail(text))
              storage.write("email", emailController.text);
              homeController.updateEmail(emailController.text);
              emailController.text = "";
            }, "sumbit"),
            button(() {
              emailController.text = storage.read("email") ?? "";
            }, "view"),
            button(() {
              homeController.updateStatus("offline");
            }, "update"),
            Obx(() => Text("status: ${homeController.status.value}")),
            Obx(() => Text("email: ${homeController.email.value}")),
            button(() {
              homeController.updateStatus("offline");
            }, "updateStatus()"),
            button(() {
              Get.toNamed(ShopScreen.id, arguments: "zika");
            }, "Get.toNamed(ShopScreen.id)"),
          ],
        ),
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
        title: Text("WelcomeScreen"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }
}
