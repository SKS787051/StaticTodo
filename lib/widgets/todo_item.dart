import 'package:flutter/material.dart';
import 'package:todoappstatic/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final Todo todo;
  final onToDoChangd;
  final onDeleteItem;
  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onToDoChangd,
      required this.onDeleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onToDoChangd(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: Colors.blue,
          ),
          title: Text(
            todo.todotext!,
            style: TextStyle(
                fontSize: 16,
                decoration: todo.isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todo.id);
                // print("object  bsdk");
              },
            ),
          ),
        ));
  }
}
