import 'package:fit_app/components/themes/theme.dart';
import 'package:fit_app/screens/home/components/custom_appbar.dart';
import 'package:fit_app/screens/home/components/drawer.dart';
import 'package:fit_app/screens/home/settings/alarm.dart';
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
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Text(
            'Settings',
            style: Theme.of(context).textTheme.headline1,
          ),
          Alarm(),
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
