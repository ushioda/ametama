import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ametama/models/date_data.dart';
import 'package:ametama/screens/top_screen.dart';
import 'package:ametama/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: ChangeNotifierProvider(
        create: (context) => DateData(),
        child: TopScreen(),
      ),
    );
  }
}
