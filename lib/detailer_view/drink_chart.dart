/// Donut chart example. This is a simple pie chart with a hole in the middle.
//import 'package:charts_flutter/flutter.dart' as charts;
import './drink_series.dart';
import 'package:flutter/material.dart';

class DoughnutChart extends StatelessWidget {
  final List<DrinkSeries> data;
  final int cycleNo;

  DoughnutChart({this.data, this.cycleNo});
  @override
  Widget build(BuildContext context) {
    print(data[cycleNo]);
    return Container(
      
    );
  }
}