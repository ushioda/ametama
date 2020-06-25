import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkYellow,
        title: Text(
          'あめたまについて',
          style: TextStyle(fontFamily: kKosugiMaru),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('あめたまについて'),
            Text('ご留意事項'),
            Text('使用方法'),
            Text('Icon made by Freepik from www.flaticon.com')
          ],
        ),
      ),
    );
  }
}
