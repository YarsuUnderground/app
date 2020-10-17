import 'package:app/splashScreen.dart';
import 'package:app/taskViewScreen.dart';
import 'package:app/userScreen.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:flutter/foundation.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ориентир',
      theme: ThemeData(
        primarySwatch: AppColors.mainBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserScreen(),
    );
  }
}
