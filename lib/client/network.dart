import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';
import 'task.dart';

class NetworkClient {
  static const server = "dcrvosys.herokuapp.com";
  var client = http.Client();
  String token;
  // OK
  Future<String> login(String login, String password) async {
    Uri url = new Uri(
      scheme: "https",
      host: server,
      path: "/auth/login/",
      queryParameters: {"login": "$login", "password": "$password"},
    );
    var response = await http.get(url.toString());

    dynamic data = json.decode(response.body);

    String token = data["credentials"]["token"];

    return token;
  }

  // OK
  Future<String> register(String email, String password, String phone,
      String first_name, String second_name) async {
    Uri url = new Uri(
      scheme: "https",
      host: server,
      path: "/auth/register/",
      queryParameters: {
        "email": "$email",
        "password": "$password,",
        "phone": "$phone",
        "first_name": "$first_name",
        "second_name": "$second_name"
      },
    );
    var response = await http.get(url.toString());
    dynamic data = json.decode(response.body);
    String token = data["token"];
    return token;
  }

  // OK
  Future<bool> getUserType(String token) async {
    Uri url = new Uri(
      scheme: "https",
      host: server,
      path: "/user/user_type/",
      queryParameters: {"token": "$token"},
    );
    var response = await http.get(url.toString());

    dynamic data = json.decode(response.body);

    bool isAdmin = data["isAdmin"];

    return isAdmin;
  }

  // OK
  Future<int> getMyId(String token) async {
    Uri url = new Uri(
      scheme: "https",
      host: server,
      path: "/user/user_id/",
      queryParameters: {"token": "$token"},
    );
    var response = await http.get(url.toString());

    dynamic data = json.decode(response.body);

    int userId = data["id"];

    return userId;
  }

  // OK
  Future<User> getUser(int id) async {
    Uri url = new Uri(
      scheme: "https",
      host: server,
      path: "/user/user_data/",
      queryParameters: {"id": "$id"},
    );
    var response = await http.get(url.toString());

    dynamic data = json.decode(response.body);

    User user = User();
    user.firstName = data["first_name"];
    user.secondName = data["second_name"];
    user.isAdmin = data["isAdmin"];
    user.email = data["email"];
    user.phone = data["phone"];

    return user;
  }

  Future<List<Task>> getTasks(int id) async {
    Uri url = new Uri(
      scheme: "https",
      host: server,
      path: "/user/user_tasks/",
      queryParameters: {"id": "$id"},
    );
    var response = await http.get(url.toString());

    dynamic data = json.decode(response.body);

    print(response.body);

    return null;
  }

  Future<void> createTask(Task task) async {
    Uri url = new Uri(
      scheme: "https",
      host: server,
      path: "/user/user_data/",
    );
    var response = await http.post(
      url.toString(),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "creatorId": task.creatorId,
        "name": task.name,
        "description": task.description,
        "tags": task.tags,
        "deadline": task.deadline.toString(),
        "performers": task.performers,
        "subtasks": task.subtasks,
      }),
    );
  }
}

final NetworkClient client = new NetworkClient();
