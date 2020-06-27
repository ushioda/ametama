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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              InfoBox(
                title: '留意事項',
                text:
                    'あめたまは、アメリカで販売されている鶏卵の消費期限を日本の一般的な基準で表示するスマホアプリです。使用に際し、鶏卵の品質を保証したり、特定の調理方法を推奨したりするものではありません。',
              ),
              InfoBox(
                title: '使用方法',
                text: '側面に記載されている001〜365の三桁の数字を記入してください。',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String title;
  final String text;

  InfoBox({this.title, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24.0),
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
          Padding(
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
          ),
        ],
      ),
    );
  }
}
