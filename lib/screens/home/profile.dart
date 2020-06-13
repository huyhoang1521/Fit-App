import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class Strength extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StrengthState();
  }
}

class Hypertrophy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HypertrophyState();
  }
}

final myUsername = TextEditingController(text: 'NICKY P');
final myBirthDate = TextEditingController(text: '09/21/1997');
final myWeight = TextEditingController(text: 'None of your god dam business');
final myHeight = TextEditingController(text: '214 cm');
bool pressAttention = false;
bool strengthSelected = false;
bool hypertrophySelected = false;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent[200],
          ),
          width: 100,
          child: Row(
            children: [
              Text(
                '  Name: ',
                style: TextStyle(color: Colors.white),
              ),
              new Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  controller: myUsername,
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent,
          ),
          width: 100,
          child: Row(
            children: [
              Text(
                '  BirthDate: ',
                style: TextStyle(color: Colors.white),
              ),
              new Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  controller: myBirthDate,
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent,
          ),
          width: 100,
          child: Row(
            children: [
              Text(
                '  Weight: ',
                style: TextStyle(color: Colors.white),
              ),
              new Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  controller: myWeight,
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent,
          ),
          width: 100,
          child: Row(
            children: [
              Text(
                '  Height: ',
                style: TextStyle(color: Colors.white),
              ),
              new Flexible(
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  controller: myHeight,
                  style: TextStyle(color: Colors.white),
                  // textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
      Text(
        'Workout Goals:',
        style: TextStyle(fontSize: 25),
      ),
      GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurpleAccent,
              ),
              child: Column(children: <Widget>[
                RaisedButton(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset('assets/images/OAC.jpg'),
                    onPressed: () {}),
                Spacer(),
                Text(
                  'One Arm Pull Up',
                  style: TextStyle(fontSize: 17),
                ),
              ]),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent,
                ),
                child: Text('Planche')),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent,
                ),
                child: Text('Back Lever')),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurpleAccent,
              ),
              child: Text('Front Lever'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent,
                ),
                child: Text('Handstand PushUp')),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurpleAccent,
                ),
                child: Text('One Arm Push Up')),
          ]),
      Text('Fitness Goal'),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Strength(),
          Hypertrophy(),
          Container(
            child: RaisedButton(
              // color: Colors.deepPurpleAccent,
              child: Text('Weight Loss',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              color: pressAttention ? Colors.grey : Colors.deepPurpleAccent,
              onPressed: () => setState(() => pressAttention = !pressAttention),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    ]);
  }
}

class _StrengthState extends State<Strength> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
          // color: Colors.deepPurpleAccent,
          child: Text('Strength',
              style: TextStyle(
                color: Colors.white,
              )),
          color: pressAttention ? Colors.grey : Colors.deepPurpleAccent,
          onPressed: () {
            setState(() => pressAttention = !pressAttention);
          }),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Colors.deepPurpleAccent,
      ),
    );
  }
}

class _HypertrophyState extends State<Hypertrophy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        // color: Colors.deepPurpleAccent,
        child: Text('Hypertrophy',
            style: TextStyle(
              color: Colors.white,
            )),
        color: strengthSelected ? Colors.grey : Colors.deepPurpleAccent,
        onPressed: () => setState(() => pressAttention = !pressAttention),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: Colors.deepPurpleAccent,
      ),
    );
  }
}

void doSomething(String buttonName) {
  if (buttonName == "Strength") {
    if (pressAttention = false) {
      strengthSelected = true;
      pressAttention = true;
    } else {
      pressAttention = false;
      strengthSelected = false;
    }
  }
  if (buttonName == 'Hypertrophy') {
    if (pressAttention = false) {
      hypertrophySelected = true;
      pressAttention = true;
    } else {
      pressAttention = false;
      hypertrophySelected = false;
    }
  }
}
