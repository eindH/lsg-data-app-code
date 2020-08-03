import 'package:flutter/material.dart';

class OverviewTable extends StatelessWidget {
  final parsedData;
  OverviewTable({this.parsedData});

  double volOfDrinks() {
    //print(parsedData);
    double sum = 0;
    for (var drink in parsedData['drinks']) {
      sum += drink['vol'];
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    double volDrinks = volOfDrinks();
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        width: 200,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Cycle',
                textScaleFactor: 1.5,),
                Text('${parsedData['cycleNo'].toString()}',
                textScaleFactor: 1.5,)
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Drinks',
                textScaleFactor: 1.5,),
                Text('${parsedData['drinks'].length.toString()} ($volDrinks ml)',
                textScaleFactor: 1.5,)
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Leaks',
                textScaleFactor: 1.5,),
                Text('${parsedData['leaks'].length.toString()}',
                textScaleFactor: 1.5,)
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Progress',
                textScaleFactor: 1.5,),
                Text('${parsedData['progress']}%',
                textScaleFactor: 1.5,)
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Date',
                textScaleFactor: 1.5,),
                Text('${parsedData['date']}',
                textScaleFactor: 1.5,)
              ],
            ),
          ]
        )
      ),
    );
  }
}
