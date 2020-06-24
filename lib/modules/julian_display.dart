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
        color: kLightYellow,
        padding: EdgeInsets.only(top: 16, left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DigitBox(digitString: dateData.digits[0]),
                DigitBox(digitString: dateData.digits[1]),
                DigitBox(digitString: dateData.digits[2]),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * kDigitBoxSizeRatio * 3,
              child: Text(
                dateData.dateError
                    ? '001～${dateData.julianEnd}の数字を入力してください。'
                    : '',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: kKosugiMaru,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
