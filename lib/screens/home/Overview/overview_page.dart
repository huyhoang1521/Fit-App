import 'package:fit_app/screens/home/Overview/overview_button.dart';
import 'package:fit_app/screens/home/Overview/prog_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class Overview extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OverviewState();
  }
}

bool pressed = false;

Color green = const Color.fromRGBO(30, 201, 116, 1.0);

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    double _fitWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Progress Goals',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: titleDiv,
            ),
            OverViewButton(
              text: 'One Arm Chin-up',
              percentText: '50%',
              percent: 0.5,
              image: 'assets/images/OAC.jpg',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage()),
                );
              },
            ),
            OverViewButton(
              text: 'Handstand Push-up',
              percentText: '90%',
              percent: 0.9,
              image: 'assets/images/HandStandRollout.jpeg',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage()),
                );
              },
            ),
            Stack(children: [
              OverViewButton(
                text: 'Back Lever',
                percentText: '30%',
                percent: 0.3,
                image: 'assets/images/BackLever.jpg',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProgressPage()),
                  );
                },
              ),
              AnimatedContainer(
                color: kPrimaryLightColor,
                duration: Duration(seconds: 2),
                width: pressed ? .88 * _fitWidth : 0,
                height: 160,
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(Icons.more_horiz, color: kPrimaryColor),
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
