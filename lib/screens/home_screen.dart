import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_app_getx/controller/todo_controller.dart';
import 'package:new_app_getx/screens/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = "/home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoController = Get.find<TodoController>();
  final storage = GetStorage();

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Obx(
        () {
          return ListView.separated(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) => Dismissible(
              key: UniqueKey(),
              onDismissed: (_) {
                todoController.todos.removeAt(index);
              },
              child: ListTile(
                title: Text(todoController.todos[index].title),
                onTap: () async {
                  todoController.todos[index] = await Get.toNamed(
                    TodoScreen.id,
                    arguments: todoController.todos[index],
                  );
                },
                trailing: Icon(Icons.edit),
                leading: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (value) {
                    var todo = todoController.todos[index];
                    todo.done = value!;
                    todoController.todos[index] = todo;
                  },
                ),
              ),
            ),
            separatorBuilder: (context, pos) => Divider(),
          );
        },
      ),
    );
  }

  FloatingActionButton buildFloatActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Get.toNamed(TodoScreen.id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
      floatingActionButton: buildFloatActionButton(),
    );
  }
}
