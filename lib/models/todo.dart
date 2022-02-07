class Todo {
  Todo({
    required this.title,
    this.done = false,
  });
  String title;
  bool done;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json["title"],
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "done": done,
      };
}
