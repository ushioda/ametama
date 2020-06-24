import 'package:flutter/material.dart';
import 'package:ametama/models/date_data.dart';
import 'package:ametama/components/date_card.dart';
import 'package:ametama/constants.dart';
import 'package:provider/provider.dart';

class ResultDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(flex: kFlexRatio1, child: Container()),
              Expanded(
                flex: kFlexRatio2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          'パック日',
                          style: TextStyle(
                            fontSize: kFontSize2,
                            fontFamily: kKosugiMaru,
                            color: kDarkYellow,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '消費期限',
                          style: TextStyle(
                            fontSize: kFontSize2,
                            fontFamily: kKosugiMaru,
                            color: kDarkYellow,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedDateList extends StatefulWidget {
  @override
  _AnimatedDateListState createState() => _AnimatedDateListState();
}

class _AnimatedDateListState extends State<AnimatedDateList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DateData>(
      builder: (context, dateData, child) {
        return AnimatedList(
            initialItemCount: dateData.julianList.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            key: dateData.listKey,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: DateCard(
                  julianDate: dateData.julianList[index],
                  daysFromPackToExpiration: dateData.daysFromPackToExpiration,
                ),
              );
            });
      },
    );
  }
}
