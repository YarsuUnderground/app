import 'dart:io';

import 'package:app/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget loader = CircularProgressIndicator(
    backgroundColor: Colors.white,
  );

  void onLoaded() async {
    sleep(const Duration(seconds: 1));
    setState(() {
      loader = Column(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage(),
                ),
              );
            },
            child: Text("Вход"),
            minWidth: 500,
            height: 50,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: MaterialButton(
              onPressed: () {},
              child: Text("Регистрация"),
              minWidth: 500,
              height: 50,
              color: Colors.white,
            ),
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    onLoaded();
    // TODO real
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ориентир",
                style: TextStyle(color: Colors.white, fontSize: 48),
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: loader,
              )
            ],
          ),
        ),
      ),
    );
  }
}
