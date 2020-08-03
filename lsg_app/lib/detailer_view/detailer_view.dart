import './drink_series.dart';
import './mini_views/video_views.dart';
import 'package:flutter/material.dart';
//import 'drink_chart.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import './mini_views/overview_table.dart';
import './mini_views/doughnut_chart.dart';

class DetailerView extends StatefulWidget {
  int cycleNo;
  var parsedData;

  DetailerView({this.cycleNo, this.parsedData});
  @override
  _DetailerViewState createState() => _DetailerViewState();
}

class _DetailerViewState extends State<DetailerView> {
  /*
  final List<DrinkSeries> data = [
    DrinkSeries(
      cycle: '1', 
      leaks: 3, 
      drinks: 6, 
      events: [
        DrinkEvents(
          type: 'coffee',
          dateTime: DateTime.now(),
          volMl: 200.0,
        ),
        DrinkEvents(
          type: 'water',
          dateTime: DateTime.now(),
          volMl: 300.0,
        )],
    ),
    DrinkSeries(
      cycle: '2', 
      leaks: 2, 
      drinks: 2, 
      events: [
        DrinkEvents(
          type: 'coffee',
          dateTime: DateTime.now(),
          volMl: 20.0,
        ),
        DrinkEvents(
          type: 'water',
          dateTime: DateTime.now(),
          volMl: 350.0,
        )],
    ),
    DrinkSeries(
      cycle: '3', 
      leaks: 2, 
      drinks: 2, 
      events: [
        DrinkEvents(
          type: 'coffee',
          dateTime: DateTime.now(),
          volMl: 20.0,
        ),
        DrinkEvents(
          type: 'water',
          dateTime: DateTime.now(),
          volMl: 350.0,
        )],
    ),
    DrinkSeries(
      cycle: '4', 
      leaks: 2, 
      drinks: 2, 
      events: [
        DrinkEvents(
          type: 'coffee',
          dateTime: DateTime.now(),
          volMl: 20.0,
        ),
        DrinkEvents(
          type: 'water',
          dateTime: DateTime.now(),
          volMl: 350.0,
        )],
    ),
    DrinkSeries(
      cycle: '5', 
      leaks: 2, 
      drinks: 2, 
      events: [
        DrinkEvents(
          type: 'coffee',
          dateTime: DateTime.now(),
          volMl: 20.0,
        ),
        DrinkEvents(
          type: 'water',
          dateTime: DateTime.now(),
          volMl: 350.0,
        )],
    ),
  ];
  */
  @override
  Widget build(BuildContext context) {
    print('Detailer view: ${widget.cycleNo}');
    return widget.cycleNo > -1 && widget.parsedData != null ? Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: Card(
          elevation: 6,
          margin: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(    //Creates the summary table on LHS
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OverviewTable(parsedData: widget.parsedData,),
                ],
              ),
              Column(    //Creates drinks pie chart in centre
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  widget.cycleNo > -1 ? CustomDoughnutChart(parsedData: widget.parsedData) : Text('Error'),
                ],
              ),
              Column(    //Creates the video table on RHS
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  VideoViews(parsedData: widget.parsedData),
                ],
              ),
            ]
          )
        ),
      ),
    ) : Expanded(child: Text('Select a cycle from the bar chart to view more detail'));
  }
}
