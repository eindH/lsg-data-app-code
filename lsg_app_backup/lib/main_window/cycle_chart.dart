import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'cycle_series.dart';
import 'chart_bar.dart';

class CycleChart extends StatelessWidget {
  final List<CycleSeries> pastCycles;
  final Function(String) onClickAction;

  CycleChart({this.pastCycles, this.onClickAction});

  List<Map<String, Object>> get grouppedCycleData {
    return List.generate(pastCycles.length, (index) {
      final cycleNo = (index + 1).toString();
      var totalSumLeaks = 0.0;
      var totalSumDrinks = 0.0;

      for (var i = 0; i < pastCycles.length; i++) {
        if (pastCycles[i].cycle == cycleNo) {
          totalSumLeaks += pastCycles[i].leaks;
          totalSumDrinks += pastCycles[i].drinks;
        }
      }

      return {
        'cycle': cycleNo,
        'leaks': totalSumLeaks,
        'drinks': totalSumDrinks,
      };
    }).toList();
  }

  double get totalLeaks {
    return grouppedCycleData.fold(0.0, (sum, item) {
      return sum + item['leaks'];
    });
  }

  double get totalDrinks {
    return grouppedCycleData.fold(0.0, (sum, item) {
      return sum + item['drinks'];
    });
  }

  int get maxDrinks{
    var maxDrinkNo = 0;
    for (var drinkDay in grouppedCycleData) {
      int drinksInCycle = drinkDay['drinks'];
      if (drinksInCycle > maxDrinkNo) {
        maxDrinkNo = drinkDay['drinks'];
      }
    }
    return maxDrinkNo;
  }

  int get maxLeaks{
    var maxLeaksNo = 0;
    for (var leakDay in grouppedCycleData) {
      int leaksInCycle = leakDay['leaks'];
      if (leaksInCycle > maxLeaksNo) {
        maxLeaksNo = leakDay['leaks'];
      }
    }
    return maxLeaksNo;
  }

  @override
  Widget build(BuildContext context) {
    //print(grouppedCycleData);
    //print(maxDrinks.toString());
    //print(maxLeaks.toString());
    double demoninator = max(maxDrinks, maxLeaks) + 0.5;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: grouppedCycleData.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    ChartBar(
                      label: data['cycle'],
                      noOfLeaks: data['leaks'],
                      totalLeaks: totalLeaks == 0.0
                          ? 0.0
                          : (data['leaks'] as double) / demoninator, //totalLeaks,
                      noOfDrinks: data['drinks'],
                      totalDrinks: totalDrinks == 0.0
                          ? 0.0
                          : (data['drinks'] as double) / demoninator, //totalDrinks,
                      barWidth: grouppedCycleData.length < 8
                          ? 50
                          : (50 * 8 / grouppedCycleData.length),
                      updateDetail: (val) => onClickAction(data['cycle']),
                    ),
                    Text('Cycle ${data['cycle']}'),
                  ],
                ),
              );
            }).toList(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 8,
            ),
            Text(
              '•',
              textScaleFactor: 3,
              style: TextStyle(color: Colors.purple[100]),
            ),
            Text('Leaks'),
            SizedBox(
              width: 16,
            ),
            Text(
              '•',
              textScaleFactor: 3,
              style: TextStyle(color: Colors.purple[200]),
            ),
            Text('Drinks')
          ]),
        ],
      ),
    );
  }
}

/*
class CycleChart extends StatelessWidget {
  final List<CycleSeries> data;

  CycleChart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<CycleSeries, String>> series = [
      charts.Series(
        id: 'leaks',
        data: data,
        domainFn: (CycleSeries series, _) => series.cycle,
        measureFn: (CycleSeries series, _) => series.leaks,
        colorFn: (CycleSeries series, _) => series.barColorLeak,
      ),
      charts.Series(
        id: 'drinks',
        data: data,
        domainFn: (CycleSeries series, _) => series.cycle,
        measureFn: (CycleSeries series, _) => series.drinks,
        colorFn: (CycleSeries series, _) => series.barColorDrink,
      ),
    ];
    return Container(
      height: double.infinity,
      padding: EdgeInsets.all(8),
      child: Card(
        child: Column(
          children: <Widget>[
            Text('Graph'),
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
