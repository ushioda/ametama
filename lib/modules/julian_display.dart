import 'package:ametama/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ametama/models/date_data.dart';
import 'package:ametama/components/digit_box.dart';

class JulianDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DateData>(
      builder: (context, dateData, child) => Container(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DigitBox(digitString: dateData.digits[0]),
                DigitBox(digitString: dateData.digits[1]),
                DigitBox(digitString: dateData.digits[2]),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              dateData.dateError
                  ? '001～${dateData.julianEnd}の数字を入力してください。'
                  : '',
              style: TextStyle(
                fontSize: 14,
                fontFamily: kKosugiMaru,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
