import 'package:get/get.dart';
import 'package:new_app_getx/controller/home_controller.dart';

class HomeBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}