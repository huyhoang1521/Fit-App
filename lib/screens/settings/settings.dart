import 'package:fit_app/components/themes/theme.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/screens/settings/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:fit_app/components/themes/constants.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

bool reminder = false;
var alarmTime = new DateTime.now();

class _SettingState extends State<Setting> {
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


void requestIOSPermissions(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
      ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
}