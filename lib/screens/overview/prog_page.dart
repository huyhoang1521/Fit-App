import 'package:fit_app/screens/home/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressPageState();
  }
}

double _whateverProg = 1.00;
Color green1 = const Color.fromRGBO(30, 201, 116, 1.0);

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
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
                          'Tuck Planche,',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: .35,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PushUps',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: .9,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Whatevers',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: _whateverProg,
                        progressColor: kPrimaryColor, //green1,
                        lineHeight: 15,
                        center: Text(
                          "100%",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      SizedBox(height: 15),
                    ]),
              ),
            ),
            SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
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
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: .99,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PushUps',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: .9,
                        progressColor: kPrimaryColor,
                        lineHeight: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Dips',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      LinearPercentIndicator(
                        percent: 1.00,
                        progressColor: kPrimaryColor, //green1,
                        lineHeight: 15,
                        center: Text("100%",
                            style: Theme.of(context).textTheme.headline3),
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
