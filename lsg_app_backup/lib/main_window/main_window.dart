//import 'package:charts_flutter/flutter.dart';
import './cycle_chart.dart';
import './cycle_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'dart:convert';

//import 'graph_controller.dart';
//import '../cycle_view/cycle_view.dart';

class MainView extends StatefulWidget {
  final Function(String) barChooseFunc;
  final parsedData;

  MainView({this.barChooseFunc, this.parsedData});
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  List<CycleSeries> dataTest() {
    final mainChartData = jsonDecode(widget.parsedData);
    List<CycleSeries> data = [];
    int cycleNo = 1;
    for (var cycleName in mainChartData.keys) {
      data.add(CycleSeries(cycle: cycleNo.toString(), leaks: mainChartData[cycleName]['leaks'].length, drinks: mainChartData[cycleName]['drinks'].length));
      cycleNo += 1;
    }
    return data;
  }

  final List<CycleSeries> data = [
    CycleSeries(
      cycle: '1',
      leaks: 10,
      drinks: 2,
      barColorLeak: charts.ColorUtil.fromDartColor(Colors.blue[100]),
      barColorDrink: charts.ColorUtil.fromDartColor(Colors.blue[200]),
    ),
    CycleSeries(
      cycle: '2',
      leaks: 7,
      drinks: 4,
      barColorLeak: charts.ColorUtil.fromDartColor(Colors.blue[100]),
      barColorDrink: charts.ColorUtil.fromDartColor(Colors.blue[200]),
    ),
    CycleSeries(
      cycle: '3',
      leaks: 2,
      drinks: 1,
      barColorLeak: charts.ColorUtil.fromDartColor(Colors.blue[100]),
      barColorDrink: charts.ColorUtil.fromDartColor(Colors.blue[200]),
    ),
    CycleSeries(
      cycle: '4',
      leaks: 5,
      drinks: 2,
      barColorLeak: charts.ColorUtil.fromDartColor(Colors.blue[100]),
      barColorDrink: charts.ColorUtil.fromDartColor(Colors.blue[200]),
    ),
    CycleSeries(
      cycle: '5',
      leaks: 3,
      drinks: 1,
      barColorLeak: charts.ColorUtil.fromDartColor(Colors.blue[100]),
      barColorDrink: charts.ColorUtil.fromDartColor(Colors.blue[200]),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var mainViewData = dataTest();
    return Expanded(flex: 5, 
      //child: Container(
        child: CycleChart(pastCycles: mainViewData, onClickAction: (val) => widget.barChooseFunc(val),),
      //)
    );
  }
}