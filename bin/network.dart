import 'package:app/client/network.dart';
import 'package:app/client/task.dart';

void main(List<String> args) async {
  NetworkClient client = new NetworkClient();
  Task task = new Task();
  task.creatorId = 4;
  task.name = "Name";
  task.description = "Desc";
  task.performers = [1, 2];
  task.subtasks = [1, 2];
  task.tags = ["A", "B"];
  task.deadline = DateTime.now();
  //print(client.createTask(task));
  print(client.getTasks(4));
}
