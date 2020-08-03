import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' as json;

import './detailer_view/detailer_view.dart';
import './main_window/main_window.dart';
import 'package:http/http.dart' as http;

int alreadyLoaded = 0;

Future<String> loadAsset() async {
  return await rootBundle.loadString('data.json');
}

String data = '''{
    "cycle1":{
        "cycleNo": 1,
        "leaks": [{"time": "2020-07-15 09:35:27.266"}, {"time": "2020-07-15 13:24:30.101"}],
        "drinks": [{"type": "coffee", "vol": 150, "time": "2020-07-15 08:20:21.266"}, {"type": "water", "vol": 550, "time": "2020-07-15 12:11:29.266"}, {"type": "tea", "vol": 150, "time": "2020-07-15 08:20:21.266"}],
        "videos": [{"title": "video1", "time": "2020-07-15 10:44:47.122", "duration": 35}, {"title": "video2", "time": "2020-07-15 10:46:40.122", "duration": 55}],
        "progress": 50,
        "date" : "2020-07-15"
    },
    "cycle2":{
        "cycleNo": 2,
        "leaks": [{"time": "2020-07-20 12:36:21.266"}],
        "drinks": [{"type": "tea", "vol": 200, "time": "2020-07-20 07:03:15.116"}, {"type": "water", "vol": 600, "time": "2020-07-20 13:11:19.622"}],
        "videos": [{"title": "video3", "time": "2020-07-20 08:05:20.161", "duration": 42}],
        "progress": 12,
        "date": "2020-07-20"
    },
    "cycle3":{
        "cycleNo": 3,
        "leaks": [{"time": "2020-07-25 06:11:13.116"}, {"time": "2020-07-25 12:01:5.112"}, {"time": "2020-07-25 19:58:52.677"}],
        "drinks": [{"type": "water", "vol": 250, "time": "2020-07-25 08:09:10.998"}, {"type": "alcohol", "vol": 100, "time": "2020-07-25 14:12:12.811"}, {"type": "water", "vol": 30, "time": "2020-07-25 18:19:08.211"}],
        "videos": [{"title": "video4", "time": "2020-07-25 07:13:11.116", "duration": 12}, {"title": "video5", "time": "2020-07-25 10:34:13.116", "duration": 76}],
        "progress": 65,
        "date": "2020-07-25"
    },
    "cycle4":{
        "cycleNo": 4,
        "leaks": [{"time": "2020-07-26 06:11:13.116"}, {"time": "2020-07-26 12:01:5.112"}, {"time": "2020-07-26 19:58:52.677"}],
        "drinks": [{"type": "water", "vol": 250, "time": "2020-07-25 08:09:10.998"}, {"type": "alcohol", "vol": 100, "time": "2020-07-25 14:12:12.811"}, {"type": "water", "vol": 30, "time": "2020-07-25 18:19:08.211"}, {"type": "tea", "vol": 30, "time": "2020-07-25 18:19:08.211"}, {"type": "carbonated", "vol": 30, "time": "2020-07-25 18:19:08.211"}, {"type": "coffee", "vol": 30, "time": "2020-07-25 18:19:08.211"}, {"type": "still", "vol": 30, "time": "2020-07-25 18:19:08.211"}],
        "videos": [{"title": "video4", "time": "2020-07-25 07:13:11.116", "duration": 12}, {"title": "video5", "time": "2020-07-25 10:34:13.116", "duration": 76}],
        "progress": 5,
        "date": "2020-07-26"
    },
    "cycle5":{
        "cycleNo": 5,
        "leaks": [{"time": "2020-07-26 06:11:13.116"}],
        "drinks": [{"type": "water", "vol": 250, "time": "2020-07-25 08:09:10.998"}, {"type": "water", "vol": 30, "time": "2020-07-25 18:19:08.211"}, {"type": "tea", "vol": 30, "time": "2020-07-25 18:19:08.211"}, {"type": "carbonated", "vol": 30, "time": "2020-07-25 18:19:08.211"}],
        "videos": [{"title": "video4", "time": "2020-07-25 07:13:11.116", "duration": 12}, {"title": "video5", "time": "2020-07-25 10:34:13.116", "duration": 76}],
        "progress": 5,
        "date": "2020-07-29"
    }
}''';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int cycleView = -1;

  void updateDetailedView(val){
    setState(() {
      cycleView = int.parse(val);
    });
  }

   getDataAPI(userKey) async{
    if (userKey != null) {
      var response = await http.get('http://localhost:5000/getUseableData/${userKey}');
      //print(response.body);
      //print(response.body);
      if (response.body != 'Does not exist' && '${response.body[0]}' != '<') {
        setState(() {
          data = response.body;
          cycleView = -1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (alreadyLoaded == 0) {
      getDataAPI('7890');
      alreadyLoaded = 1;
    }

    final myController = TextEditingController();
    print(myController.text);
    //getDataAPI('7890');
    var parsedData = json.jsonDecode(data);

    return MaterialApp(
      title: 'Data viewer',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple[300],
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Enter user code'
              ),
              controller: myController,
              onSubmitted: (val) => getDataAPI(val),
            ),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(child: MainView(barChooseFunc: updateDetailedView, parsedData: data)),
                Container(child: DetailerView(cycleNo: cycleView, parsedData: parsedData['cycle$cycleView'])),
              ],
            ),
          )),
    );
  }
}