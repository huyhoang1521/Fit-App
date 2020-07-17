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
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Basics',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Handstand'),
                      ),
                      LinearPercentIndicator(
                        percent: .5,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Tuck Planche',
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: .35,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('PushUps'),
                      ),
                      LinearPercentIndicator(
                        percent: .9,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                        center: Text("90%"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Whatevers'),
                      ),
                      LinearPercentIndicator(
                        percent: 1.00,
                        progressColor: Colors.greenAccent,
                        lineHeight: 15,
                        center: Text("100%"),
                      ),
                      SizedBox(height: 15),
                    ]),
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '"Skill" Specific',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Handstand',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: .5,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Tuck Planche',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: .35,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('PushUps'),
                      ),
                      LinearPercentIndicator(
                        percent: .9,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                        center: Text("90%"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Whatevers'),
                      ),
                      LinearPercentIndicator(
                        percent: 1.00,
                        progressColor: Colors.green,
                        lineHeight: 15,
                        center: Text("100%"),
                      ),
                      SizedBox(height: 15),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
