import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:ametama/models/date_data.dart';
import 'package:ametama/screens/top_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// make sure that the screen does not rotate
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DateData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TopScreen(),
      ),
    );
  }
}
