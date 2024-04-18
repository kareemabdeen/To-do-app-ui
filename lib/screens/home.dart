import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/helper/Todo_Item.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/widgets/customappbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final toDoList = ToDoModel.toDoList();
  List<ToDoModel> resultOfSearch = [];

  @override
  void initState() {
    resultOfSearch = toDoList;
    super.initState();
  }

  final todoTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: tdBGColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'All Todos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      for (ToDoModel todo in resultOfSearch.reversed)
                        TodoItem(
                          toDo: todo,
                          onTapItemState: handleTodoChange,
                          deleteOnTap: deletetoDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 0,
                    ),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    child: TextField(
                      controller: todoTextController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new todo item',
                        contentPadding: EdgeInsets.only(
                          left: 5,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    bottom: 20,
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: const Size(80, 80),
                        elevation: 20,
                      ),
                      onPressed: () {
                        addToDoItem(todoTextController.text);
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void searchForGivenTodoItem(String searchedtodoname) {
    List<ToDoModel> searchResults = [];

    if (searchedtodoname.isEmpty) {
      searchResults = toDoList;
    } else // user type an text
    {
      searchResults = toDoList
          .where((todoItem) => todoItem.toDoText
              .toLowerCase()
              .contains(searchedtodoname.toLowerCase()))
          .toList();
    }
    setState(() {
      resultOfSearch = searchResults;
    });
  }

  void addToDoItem(String todoText) {
    setState(() {
      toDoList.add(ToDoModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        toDoText: todoText,
      ));
    });
    todoTextController.clear();
  }

  void handleTodoChange(ToDoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deletetoDoItem(String idOfItem) {
    setState(() {
      toDoList.removeWhere((itemfromlist) => idOfItem == itemfromlist.id);
    });
  }

  Container searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        onChanged: (value) => searchForGivenTodoItem(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(0),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: tdGrey,
            fontSize: 18,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 30,
          ),
        ),
      ),
    );
  }
}
