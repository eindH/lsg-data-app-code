import 'package:charts_flutter/flutter.dart'as charts;
//import 'package:flutter/foundation.dart';

class CycleSeries{
  final String cycle;
  final int leaks;
  final int drinks;
  final charts.Color barColorLeak;
  final charts.Color barColorDrink;

  CycleSeries({
    this.cycle,
    this.leaks,
    this.drinks,
    this.barColorLeak,
    this.barColorDrink,
  });
}