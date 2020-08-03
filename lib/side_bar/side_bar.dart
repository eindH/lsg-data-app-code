import 'package:flutter/material.dart';

List<String> cycles = <String>['Overview', 'Cycle 1', 'Cycle 2', 'Cycle 3', 'Cycle 4'];

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.separated(
          padding: const EdgeInsets.all(3),
          itemCount: cycles.length,
          separatorBuilder: (BuildContext context, int index) => Divider(height: 2),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              color: Colors.grey[200],
              child: Center(
                child: Text('${cycles[index]}'),
              ),
            );
          }),
    );
  }
}
