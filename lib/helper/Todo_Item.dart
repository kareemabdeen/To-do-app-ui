import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/model/todo_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.toDo,
      required this.onTapItemState,
      required this.deleteOnTap});
  final ToDoModel? toDo;
  final onTapItemState;
  final deleteOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        onTap: () {
          onTapItemState(toDo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: Icon(
          toDo!.isDone
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: tdBlue,
        ),
        tileColor: Colors.white,
        title: Text(
          toDo!.toDoText,
          style: TextStyle(
            color: tdBlack,
            fontSize: 16,
            decoration:
                toDo!.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(9),
            ),
            child: IconButton(
              iconSize: 18,
              onPressed: () {
                deleteOnTap(toDo!.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )),
      ),
    );
  }
}
