import 'package:ametama/models/date_data.dart';
import 'package:flutter/material.dart';
import 'package:ametama/modules/julian_display.dart';
import 'package:ametama/modules/keypad.dart';
import 'package:provider/provider.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: JulianDisplay(),
            ),
            Expanded(
              flex: 7,
              child: Consumer<DateData>(
                builder: (context, dateData, child) {
                  return Text(
                    dateData.packedDate.toString(),
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
            ),
            Expanded(
              flex: 8,
              child: KeyPad(),
            ),
          ],
        ),
      ),
    );
  }
}
