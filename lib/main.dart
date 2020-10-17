import 'package:app/splashscreen.dart';
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
      home: SplashScreen(),
    );
  }
}
