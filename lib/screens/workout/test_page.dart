import 'package:fit_app/components/rounded_button.dart';
import 'package:fit_app/screens/workout/cool_down.dart';
import 'package:fit_app/screens/workout/eccentric.dart';
import 'package:fit_app/screens/workout/isometric.dart';
import 'package:fit_app/screens/workout/warmup.dart';
import 'package:flutter/material.dart';

import 'concentric.dart';

class TestPage extends StatefulWidget {
  TestPage() : super();
  @override
  _TestPageState createState() => _TestPageState();
}

@override
State<StatefulWidget> createState() {
  return _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.75),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            )
          ]),
          child: AppBar(
            title: Text('Fit For Life'),
            elevation: 10,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Exercise Pages',
              style: Theme.of(context).textTheme.headline1,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RoundedButton(
                color: Theme.of(context).buttonColor,
                //textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WarmUp()),
                    //MaterialPageRoute(builder: (context) => StartWorkout()),
                  );
                },
                text: 'Warm Up',
                //onLongPress: ,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RoundedButton(
                color: Theme.of(context).buttonColor,
                //textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Concentric()),
                    //MaterialPageRoute(builder: (context) => StartWorkout()),
                  );
                },
                text: 'Concentric',
                //onLongPress: ,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RoundedButton(
                color: Theme.of(context).buttonColor,
                //textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Eccentric()),
                    //MaterialPageRoute(builder: (context) => StartWorkout()),
                  );
                },
                text: 'Eccentric',
                //onLongPress: ,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RoundedButton(
                color: Theme.of(context).buttonColor,
                //textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Isometric()),
                    //MaterialPageRoute(builder: (context) => StartWorkout()),
                  );
                },
                text: 'Isometric',
                //onLongPress: ,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RoundedButton(
                color: Theme.of(context).buttonColor,
                //textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CoolDown()),
                    //MaterialPageRoute(builder: (context) => StartWorkout()),
                  );
                },
                text: 'Cool Down',
                //onLongPress: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
