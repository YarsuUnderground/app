import 'package:app/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'adminScreen.dart';

// TODO: Login page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var login = TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Логин',
      ),
      controller: controller,
    );

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ориентир",
                style: TextStyle(color: Colors.blue, fontSize: 48),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Container(width: 500, child: login),
              ),
              Container(
                width: 500,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: MaterialButton(
                  child: Text(
                    "Войти",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if (login.controller.text == "admin") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AdminHomeScreen(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserScreen(),
                        ),
                      );
                    }
                  },
                  minWidth: 500,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
