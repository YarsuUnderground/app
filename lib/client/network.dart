import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

const server = "";
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

void main() async {}
