import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_app_getx/bindings/todo_bindings.dart';
import 'package:new_app_getx/screens/home_screen.dart';
import 'package:new_app_getx/screens/todo_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: HomeScreen.id,
      getPages: [
        GetPage(
          name: HomeScreen.id,
          page: () => HomeScreen(),
          binding: TodoBindings(),
        ),
        GetPage(
          name: TodoScreen.id,
          page: () => TodoScreen(),
        ),
      ],
    );
  }
}
