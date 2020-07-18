import 'package:flutter/material.dart';
import '../algorithms/workout_constructor.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    showAlert(context);
    super.initState();
  }

  Future showAlert(BuildContext context) async {
    await Future.delayed(Duration(seconds: 0));
    WorkoutConstructor().createWorkout(context);
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: Colors.yellow,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Test",
                        style: TextStyle(fontSize: 44, color: Colors.black),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
