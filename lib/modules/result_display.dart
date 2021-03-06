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
        AnimatedDateList(),
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
        /// expanded widget necessary so the extended list fits in the space
        return Expanded(
          child: AnimatedList(
              initialItemCount: dateData.julianList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              key: dateData.listKey,
              itemBuilder: (context, index, animation) {
                /// function to slide and delete card
                return Dismissible(
                  key: Key('${dateData.julianList[index]}'),
                  background: Container(
                    color: Colors.redAccent,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: kFontSize1,
                    ),
                  ),
                  onDismissed: (direction) {
                    dateData.removeJulian(index);
                  },

                  /// card appears like it slides down
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: DateCard(
                      julianDate: dateData.julianList[index],
                      eggDuration: dateData.eggDuration,
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
