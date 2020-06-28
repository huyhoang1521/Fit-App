import 'package:flutter/material.dart';
import '../../../constants.dart';

class Settings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

bool reminder = false;
var alarmTime = new DateTime.now();

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit For Life'),
        elevation: 5,
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(children: [
            Text('Reminder'),
            Switch(
              activeColor: kPrimaryColor,
              value: reminder,
              onChanged: (bool value) {
                setState(() {
                  reminder = value;
                });
              },
            ),
          ])
        ],
      ),
    );
  }
}
