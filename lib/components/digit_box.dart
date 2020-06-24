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
          border: Border.all(color: kLightYellow, width: 2.0)),
      child: Center(
        child: Text(
          '$digitString',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.18,
//            fontWeight: FontWeight.bold,
            color: kDarkYellow,
          ),
        ),
      ),
    );
  }
}
