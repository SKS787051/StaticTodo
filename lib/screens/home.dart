import 'package:flutter/material.dart';
import 'package:todoappstatic/model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  List<Todo> _foundtodo = [];
  final _todocontroler = TextEditingController();

  @override
  void initState() {
    _foundtodo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBa(),
      body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  seachBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: const Text(
                            'All ToDos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        for (Todo todo in _foundtodo.reversed)
                          ToDoItem(
                            todo: todo,
                            onToDoChangd: _handleToDoChange,
                            onDeleteItem: _handleDeleteitem,
                          ),
                      ],
                    ),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todocontroler,
                    decoration: const InputDecoration(
                      hintText: "Add a New Todo Item",
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addtodoItem(_todocontroler.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tbBlack,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteitem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addtodoItem(String toDo) {
    setState(() {
      todosList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todotext: toDo));
    });
    _todocontroler.clear();
  }

  void _runFilter(String enterkeyboard) {
    List<Todo> results = [];
    if (enterkeyboard.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todotext!
              .toLowerCase()
              .contains(enterkeyboard.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundtodo = results;
    });
  }

  Widget seachBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tbBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20.2,
            minHeight: 18.33,
          ),
          border: InputBorder.none,
          hintText: 'search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBa() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Icon(
          Icons.menu,
          color: tbBlack,
          size: 30,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avi.png'),
          ),
        )
      ]),
    );
  }
}
