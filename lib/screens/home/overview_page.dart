import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OverviewState();
  }
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        new CircularPercentIndicator(
          radius: 300.0,
          lineWidth: 10.0,
          percent: .5,
          center: Column(children: <Widget>[
            Container(
              child: new Image.asset('assets/images/OAC.jpg'),
              width: 100,
              height: 100,
            ),
            new Text("50%"),
          ]),
          progressColor: Colors.green,
        ),
      ],
    );
  }
}
