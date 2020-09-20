import 'package:fit_app/components/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fit_app/components/constants.dart';

// Used to Select users workout goals
bool strength = false;
bool hypertrophy = false;
bool weightLoss = false;

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
      ),
      body: Column(
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headline1,
          ),
          SwitchListTile(
            activeColor: kPrimaryColor,
            title: Text(
              'Reminder',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onChanged: (bool value) {
              setState(() {
                reminder = value;
              });
            },
            value: reminder,
          ),
//          Row(children: [
//            Text('Reminder'),
//            Switch(
//              activeColor: kPrimaryColor,
//              value: reminder,
//              onChanged: (bool value) {
//                setState(() {
//                  reminder = value;
//                });
//              },
//            ),
//          ]),
          Consumer<ThemeNotifier>(
            builder: (context, notifier, child) => SwitchListTile(
              activeColor: kPrimaryColor,
              title: Text(
                "Dark Mode",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              onChanged: (val) {
                notifier.toggleTheme();
              },
              value: notifier.darkTheme,
            ),
          ),
        ],
      ),
    );
  }
}
