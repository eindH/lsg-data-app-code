import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double noOfLeaks;
  final double totalLeaks;
  final double noOfDrinks;
  final double totalDrinks;
  final double barWidth;
  final Function(String) updateDetail;

  ChartBar({this.label, this.noOfLeaks, this.totalLeaks, this.noOfDrinks, this.totalDrinks, this.barWidth, this.updateDetail});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => updateDetail(label),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(children: <Widget>[
            Text(noOfLeaks.toString()),
            SizedBox(height: 4),
            Container( //Leak bar
              height: MediaQuery.of(context).size.height * 0.37,
              width: barWidth,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(    //Coloured bar showing leak
                    heightFactor: totalLeaks,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
              ]),
            ),
            SizedBox(
              height: 4,
            ),
          ]),
          SizedBox(
            width: 4,
          ),
          Column(children: <Widget>[
            Text(noOfDrinks.toString()),
            SizedBox(height: 4),
            Container( //Drinks bar
              height: MediaQuery.of(context).size.height * 0.37,
              width: barWidth,
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(    //Coloured bar showing drinks
                    heightFactor: totalDrinks,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
              ]),
            ),
            SizedBox(
              height: 4,
            ),
          ]),
        ],
      ),
    );
    
  }
}
