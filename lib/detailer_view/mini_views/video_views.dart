import 'package:lsg_app/detailer_view/drink_series.dart';
import 'package:flutter/material.dart';

class VideoViews extends StatelessWidget {
  final parsedData;
  VideoViews({this.parsedData});

  List<VideoDay> dataTest(){
    List<String> videoTitles = [];
    if (parsedData['videos'].length == 0) {
      return [VideoDay(cycle: parsedData['cycleNo'].toString(), videoTitles: ['No videos'])];
    }
    for (var video in parsedData['videos']) {
      videoTitles.add(video['title']);
    }
    return [VideoDay(cycle: parsedData['cycleNo'].toString(), videoTitles: videoTitles)];
  }

  @override
  Widget build(BuildContext context) {
    List<VideoDay> data = dataTest();
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:8, vertical:8),
        height: MediaQuery.of(context).size.height * 0.31,
        width: 290,
        child: Scrollbar(
                  child: ListView.builder(
            itemCount: data[0].videoTitles.length,
            itemBuilder: (BuildContext cxt, int index){
              return Container(
                padding: EdgeInsets.all(4),
                height: 50,
                color: index % 2 == 0 ? Colors.purple[200] : Colors.purple[100],
                child: Center(child: Row(
                  children: [
                    Flexible(
                        child: Container(
                          child: Text(data[0].videoTitles[index],
                          overflow: TextOverflow.ellipsis,),
                      ),
                    )
                  ],
                )),
              );
            },
          ),
        ),
      ),
    );
  }
}