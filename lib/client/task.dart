class Task {
  int creatorId;
  String name, description;
  DateTime deadline;
  List<String> tags;
  List<int> performers;
  List<int> subtasks;
}

class SubTask {
  int creatorId;
  String name, description;
  DateTime deadline;
  List<int> performers;
  int status;
}
