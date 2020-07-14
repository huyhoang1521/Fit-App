import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressPageState();
  }
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Fit With Nick!'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Handstand'),
          LinearPercentIndicator(
            percent: .5,
            progressColor: kPrimaryColor,
            lineHeight: 15,
            width: 300.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tuck Planche',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LinearPercentIndicator(
              percent: .35,
              progressColor: kPrimaryLightColor,
              lineHeight: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('PushUps'),
          ),
          LinearPercentIndicator(
            percent: .9,
            progressColor: Colors.green,
            lineHeight: 15,
            center: Text("90%"),
          ),
        ]),
      ),
    );
  }
}
