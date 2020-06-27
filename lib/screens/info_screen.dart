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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TitleBox(title: '留意事項'),
                TextBox(
                  text:
                      'あめたまは、アメリカで販売されている鶏卵の消費期限を、日本の一般的な基準で表示するスマホアプリです。使用に際し、鶏卵の品質を保証したり、特定の調理方法を推奨したりするものではありません。',
                ),
                TitleBox(title: '使用方法'),
                TextBox(
                  text:
                      'アメリカ国内で販売されている鶏卵には、パック詰めされた日付が、前年大晦日からの日数として記載されています。通常、一般的な消費期限とともにパックの側面にあります。',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                          image: AssetImage('assets/julian_example.jpg'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  final String text;

  TextBox({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: kKosugiMaru,
          fontSize: kFontSize3,
          color: kBasicTextColor,
          height: 1.4,
        ),
      ),
    );
  }
}

class TitleBox extends StatelessWidget {
  final String title;

  TitleBox({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontFamily: kKosugiMaru,
              fontSize: kFontSize2,
              color: kDarkYellow,
            ),
          ),
        ],
      ),
    );
  }
}
