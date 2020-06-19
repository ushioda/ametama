import 'package:flutter/material.dart';
import 'package:ametama/constants.dart';

class DigitBox extends StatelessWidget {
  final String digitString;

  DigitBox({this.digitString});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * 0.27,
      width: screenWidth * 0.27,
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.08),
        ),
        child: Center(
          child: Text(
            '$digitString',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.18,
              fontWeight: FontWeight.bold,
              color: kDarkYellow,
            ),
          ),
        ),
      ),
    );
  }
}
