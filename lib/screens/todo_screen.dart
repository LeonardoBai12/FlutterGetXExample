import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_app_getx/controller/todo_controller.dart';
import 'package:new_app_getx/models/todo.dart';

class TodoScreen extends StatefulWidget {
  static String id = "/todo_screen";

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final todoController = Get.find<TodoController>();
  final storage = GetStorage();
  final todo = Get.arguments as Todo?;
  TextEditingController titleController = TextEditingController();

  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  child: Text("Cancel"),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    Get.back();
                  },
                ),
                MaterialButton(
                  child: Text("Confirm"),
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (todo == null) {
                      todoController.todos.add(
                        Todo(title: titleController.text),
                      );
                    } else {
                      todo!.title = titleController.text;
                    }
                    Get.back(result: todo);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    titleController.text = todo == null ? "" : todo!.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        backgroundColor: Colors.amberAccent,
      ),
      body: SafeArea(
        child: buildBody(),
      ),
    );
  }
}
