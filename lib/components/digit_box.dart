import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';

class DigitBox extends StatelessWidget {
  final String digitString;

  DigitBox({this.digitString});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * kDigitBoxSizeRatio,
      width: screenWidth * kDigitBoxSizeRatio,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenWidth * kDigitBoxSizeRatio * 0.11,
            ),
            Text(
              '$digitString',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:
                    screenWidth * kDigitBoxSizeRatio * kDigitToBoxSizeRatio,
//            fontWeight: FontWeight.bold,
                color: kDarkYellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
