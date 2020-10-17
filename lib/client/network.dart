import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

const server = "dcrvosys.herokuapp.com";
var client = http.Client();

Future<String> login(String login, String password) async {
  Uri url = new Uri(
    scheme: "https",
    host: server,
    path: "/login",
    queryParameters: {"login": "$login", "password": "$password,"},
  );
  var response = await http.get(url.toString());

  dynamic data = json.decode(response.body);

  String token = data["token"];

  return token;
}

Future<String> register(String email, String password, String phone,
    String first_name, String second_name) async {
  Uri url = new Uri(
    scheme: "https",
    host: server,
    path: "/register",
    queryParameters: {
      "email": "$email",
      "password": "$password,",
      "phone": "$phone",
      "first name": "$first_name",
      "second name": "$second_name"
    },
  );
  var response = await http.get(url.toString());

  dynamic data = json.decode(response.body);

  String token = data["token"];

  return token;
}

Future<bool> getUserType(String token) async {
  Uri url = new Uri(
    scheme: "https",
    host: server,
    path: "/getUserType",
    queryParameters: {"token": "$token"},
  );
  var response = await http.get(url.toString());

  dynamic data = json.decode(response.body);

  bool isAdmin = data["token"];

  return isAdmin;
}

Future<int> getMyId(String token) async {
  Uri url = new Uri(
    scheme: "https",
    host: server,
    path: "/getMyId",
    queryParameters: {"token": "$token"},
  );
  var response = await http.get(url.toString());

  dynamic data = json.decode(response.body);

  int userId = data["token"];

  return userId;
}

Future<User> getUser(int id) async {
  Uri url = new Uri(
    scheme: "https",
    host: server,
    path: "/getUser",
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

void main() async {}
