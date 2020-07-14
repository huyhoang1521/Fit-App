import 'package:fit_app/screens/home/Overview/prog_page.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

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
      body: Center(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Progress of Progressions',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('One Arm Chin Up:'),
            new CircularPercentIndicator(
              radius: 165.0,
              lineWidth: 10.0,
              percent: .5,
              center: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: GestureDetector(
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                fit: BoxFit.fitHeight,
                                colorFilter: new ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.dstATop),
                                image: AssetImage('assets/images/OAC.jpg'),
                              ),
                            ),
                          ),
                          Text(
                            '50%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProgressPage()),
                          );
                        },
                      ),
                      alignment: Alignment.bottomCenter,
                      width: 100,
                      height: 100,
                    ),
                  ]),
              progressColor: kPrimaryColor,
            ),
            Text('Back Lever:'),
            new CircularPercentIndicator(
              radius: 135.0,
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
            Text('Back Lever:'),
            new CircularPercentIndicator(
              radius: 110.0,
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
      ),
    );
  }
}
