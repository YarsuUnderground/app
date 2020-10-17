class Task {
  int id;

  // id создателя
  int creatorId;

  // название, описание
  String name, description;

  // срок сдачи
  DateTime deadline;

  List<String> tags;

  // исполнители
  List<int> performers;
  List<int> subtasks;
}

class SubTask {
  int id;

  int creatorId;

  String name, description;

  DateTime deadline;

  // исполнители
  List<int> performers;

  /*
  0 - не выполнено
  1 - выполняется
  2 - выполнено
   */
  int status;
}
