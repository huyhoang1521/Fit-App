import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/progress/exercise_percent_item.dart';
import 'stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProgressState();
  }
}

class _ProgressState extends State<Progress>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 25.0),
                  child: Text(
                    'Main Goals',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
            ExercisePercentItem(
              name: 'Exercise One',
              percent: 15,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stats()),
                );
              },
            ),
            ExercisePercentItem(
              name: 'Exercise Two',
              percent: 56,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Stats()),
                );
              },
            ),
            ExercisePercentItem(
              name: 'Exercise Three',
              percent: 78,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 14, 8, 14),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Text(
                    'Exercises Progress',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
            ),
            ExercisePercentItem(
              name: 'Exercise n',
              percent: 20,
            ),
            ExercisePercentItem(
              name: 'Exercise n',
              percent: 33,
            ),
            ExercisePercentItem(
              name: 'Exercise n',
              percent: 10,
            ),
            ExercisePercentItem(
              name: 'Exercise n',
              percent: 5,
            )
          ],
        ),
      ),
    );
  }
}
