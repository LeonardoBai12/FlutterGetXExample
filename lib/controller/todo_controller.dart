import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_app_getx/models/todo.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;

  @override
  void onInit() {
    super.onInit();

    List? storedTodos = GetStorage().read<List>("todos");

    if (storedTodos != null) {
      todos.value = storedTodos.map((e) => Todo.fromJson(e)).toList();
    }

    ever(todos, (_) {
      GetStorage().write("todos", todos.toList());
    });
  }

  void updateTodos(List<Todo> newTodos) {
    todos.value = newTodos;
  }
}
