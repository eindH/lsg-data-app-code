import 'package:lsg_app/detailer_view/drink_series.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CustomDoughnutChart extends StatelessWidget {
  final parsedData;
  CustomDoughnutChart({this.parsedData});

  List<DrinkPerType> dataTest(types) {
    List<DrinkPerType> data = [];

    for (var type in types) {
      double sum = 0;
      for (var i = 0; i < parsedData['drinks'].length; i++) {
        parsedData['drinks'][i]['type'] == type ?
        sum += parsedData['drinks'][i]['vol'] : sum = sum;
      }
      if (sum != 0) {
       data.add(DrinkPerType(type: type, volMl: sum)); 
      }
    }
    return data;
  }

  List<String> drinkTypes(){
    List<String> types = [];
    for (var item in parsedData['drinks']) {
      if (types.contains(item['type'])) {
        
      } else {
        types.add(item['type']);
      }
    }
    return types;
  }

  @override
  Widget build(BuildContext context) {
    //print(parsedData['drinks']);
    List listOfTypes = drinkTypes();
    final data = dataTest(listOfTypes);
    final colours = charts.MaterialPalette.purple.makeShades(listOfTypes.length);
    //print(colours[0].toString().substring(1));
    //print(data.length);
    List<charts.Series<DrinkPerType, String>> series = [
      charts.Series(
        id: 'Drinks',
        data: data,
        domainFn: (DrinkPerType drinkEvent, _) => drinkEvent.type,
        measureFn: (drinkEvent, _) => drinkEvent.volMl,
        colorFn: (DrinkPerType drinkEvent, index) => colours[index],
        labelAccessorFn: (drinkEvent, _) => '${drinkEvent.volMl}'
      ),
    ];
    return Center(
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    width: MediaQuery.of(context).size.height * 0.31,
                    child: charts.PieChart(
                      series,
                      animate: false,
                      //behaviors: [new charts.DatumLegend()],
                      defaultRenderer: charts.ArcRendererConfig(arcWidth: 40, arcRendererDecorators: [charts.ArcLabelDecorator()]),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: (MediaQuery.of(context).size.height * 0.1 - listOfTypes.length*7)),
                        height: MediaQuery.of(context).size.height * 0.31,
                        width: MediaQuery.of(context).size.height * 0.15,
                        child: ListView.separated(
                          itemCount: listOfTypes.length,
                          itemBuilder: (BuildContext cxt, int index){
                            return Container(
                              padding: EdgeInsets.all(3),
                              child: Text('${listOfTypes[index]}',
                                textAlign: TextAlign.center,),
                              width: 50,
                              color: Color(int.parse('ff${colours[index].toString().substring(1,7)}', radix:16)),
                            );
                         },
                         separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 3,),
                        )
                      ),
                    ],
                  )
                ],
              ),
            );
  }
}