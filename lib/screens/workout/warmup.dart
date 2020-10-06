import 'package:fit_app/screens/workout/rest.dart';
import 'package:fit_app/screens/workout/widgets/buttons.dart';
import 'package:flutter/material.dart';

class WarmUp extends StatefulWidget {
  WarmUp() : super();
  @override
  _WarmUpState createState() => _WarmUpState();
}

@override
State<StatefulWidget> createState() {
  return _WarmUpState();
}

IconData pause = Icons.pause_circle_filled;
IconData play = Icons.play_circle_filled;
IconData button = play;
bool pressed = false;

class _WarmUpState extends State<WarmUp> {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ]),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Pull Ups',
                        style: Theme.of(context).textTheme.headline2),
                  ),
                )),
          ),
          Image.asset(
            'assets/images/pullup_up.png',
            width: width * .75,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Clusters:',
                              style: Theme.of(context).textTheme.headline2),
                          Text('2',
                              style: Theme.of(context).textTheme.headline2),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).shadowColor,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Set:',
                                style: Theme.of(context).textTheme.headline2),
                            Text('2/3',
                                style: Theme.of(context).textTheme.headline2),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          Buttons(
            enabled: pressed,
            rWPressed: () {},
            fFPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RestPage()),
                //MaterialPageRoute(builder: (context) => StartWorkout()),
              );
            },
            pPPressed: () {
              setState(() {
                pressed = !pressed;
              });
            },
          ),
        ],
      ),
    );
  }
}
