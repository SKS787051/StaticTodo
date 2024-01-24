class Todo {
  String? id;
  String? todotext;
  bool isDone;

  Todo({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '1', todotext: "Buy groceries", isDone: true),
      Todo(
          id: '2',
          todotext: "mujhe Ravi ko Paise Dene hai 2/feb/2024",
          isDone: true),
      Todo(
        id: '3',
        todotext: "Go to the gym",
      ),
      Todo(
        id: '4',
        todotext: "Study for the exam",
      ),
      Todo(
        id: '5',
        todotext: "mujhe Ravi ko Paise Dene hai 2/april/2024",
      ),
      Todo(
        id: '6',
        todotext: "Ek App one week ke under bna dena hai ",
      ),
    ];
  }
}
