import 'package:get/get.dart';
import 'package:new_app_getx/controller/todo_controller.dart';

class TodoBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(TodoController());
  }
}