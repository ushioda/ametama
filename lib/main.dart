import 'package:ametama/constants.dart';
import 'package:flutter/material.dart';
import 'package:ametama/screens/top_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: TopScreen(),
    );
  }
}
