import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class Overview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OverviewState();
  }
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(0),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
        shrinkWrap: true,
        children: <Widget>[
          new CircularPercentIndicator(
            radius: 165.0,
            lineWidth: 10.0,
            percent: .5,
            center: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: new Image.asset('assets/images/OAC.jpg')),
                    alignment: Alignment.bottomCenter,
                    width: 100,
                    height: 100,
                  ),
                  new Text("50%"),
                ]),
            progressColor: kPrimaryColor,
          ),
          new CircularPercentIndicator(
            radius: 165.0,
            lineWidth: 8.0,
            percent: .35,
            center: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: new Image.asset('assets/images/BackLever.jpg'),
                    alignment: Alignment.bottomCenter,
                    width: 100,
                    height: 100,
                  ),
                  new Text("35%"),
                ]),
            progressColor: kPrimaryColor,
          ),
          new CircularPercentIndicator(
            radius: 165.0,
            lineWidth: 8.0,
            percent: .35,
            progressColor: kPrimaryColor,
            center: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: new Image.asset(
                    'assets/images/BackLever.jpg',
                    width: 75,
                    height: 100,
                  ),
                ),
                Text(
                  'Back lever',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
