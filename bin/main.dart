import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

const server = "reqres.in";
var client = http.Client();

class User {
  int id;
  String first_name;

  @override
  String toString() {
    return "id:$id , first_name: $first_name";
  }
}

Future<List<User>> getUsers(int page) async {
  Uri url = new Uri(
    scheme: "https",
    host: server,
    path: "/api/users",
    queryParameters: {
      "page": "$page",
    },
  );
  var response = await http.get(url.toString());
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${response.body}');

  dynamic data = json.decode(response.body);

  List users_data = data["data"];

  List<User> toReturn = [];

  for (var element in users_data) {
    User user = User();
    user.id = element["id"];
    user.first_name = element["first_name"];
    toReturn.add(user);
  }

  return toReturn;
}

void main() async {
  Future<List<User>> gettingUsers = getUsers(2);

  // ...
  print("Загрузка");
  print("Загрузка");
  print("Загрузка");
  print("Загрузка");
  print("Загрузка");

  List<User> result = await gettingUsers;

  print(result.join("\n"));
}
