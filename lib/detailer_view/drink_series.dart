import 'package:charts_flutter/flutter.dart'as charts;
//import 'package:flutter/foundation.dart';

class VideoDay{
  final String cycle;
  final List<String> videoTitles;

  VideoDay({
    this.cycle,
    this.videoTitles,
  });
}

class DrinkPerType{
  //coffee, tea, water, still, carbonated, alcohol 
  final String type;
  final double volMl;
  final charts.Color segmentCol;

  DrinkPerType({
    this.type,
    this.volMl,
    this.segmentCol,
  });
}

class DrinkEvents{
  final String type;
  final DateTime dateTime;
  final double volMl;
  final charts.Color segmentCol;

  DrinkEvents({
    this.type,
    this.dateTime,
    this.volMl,
    this.segmentCol,
  });
}

class DrinkSeries{
  final String cycle;
  final int leaks;
  final int drinks;
  final List<DrinkEvents> events;
  final List<String> videos;
  final charts.Color barColorLeak;
  final charts.Color barColorDrink;

  DrinkSeries({
    this.cycle,
    this.leaks,
    this.drinks,
    this.events,
    this.videos,
    this.barColorLeak,
    this.barColorDrink,
  });
}