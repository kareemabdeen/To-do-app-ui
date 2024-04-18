class ToDoModel {
  String id, toDoText;
  bool isDone;

  ToDoModel({required this.id, required this.toDoText, this.isDone = false});

  static List<ToDoModel> toDoList() {
    return [
      ToDoModel(id: '01', toDoText: 'going to Amr ', isDone: true),
      ToDoModel(id: '01', toDoText: 'going to gym '),
      ToDoModel(id: '02', toDoText: 'going to stadium '),
      ToDoModel(id: '03', toDoText: 'going to peter ', isDone: true),
      ToDoModel(id: '04', toDoText: 'going to amr '),
      ToDoModel(id: '05', toDoText: 'going to matar '),
    ];
  }
}
