import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/progress/exercise_percent_item.dart';
import 'stats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

JsonData jsonData = new JsonData('workoutData.json');
List<Map<String, dynamic>> exerciseList = new List();
List<Map<String, dynamic>> progressionList = new List();
List<int> percentList = new List();

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
    exerciseList =
        List<Map<String, dynamic>>.from(jsonData.getFileContent()['exercises']);
    progressionList = List<Map<String, dynamic>>.from(
        jsonData.getFileContent()['progressions']);

    for (int i = 0; i < exerciseList.length; i++) {
      percentList.add(
          ((progressionList[i]['level'] / exerciseList[i]['progressions']) *
                  100)
              .floor());
    }

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: ListView(
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
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: new ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exerciseList.length,
                  itemBuilder: (context, index) {
                    return ExercisePercentItem(
                      name: exerciseList[index]['name'],
                      percent: percentList[index],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Stats()),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
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
          Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                child: new ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: progressionList.length,
                  itemBuilder: (context, index) {
                    return ExercisePercentItem(
                      name: progressionList[index]['name'],
                      percent: percentList[index],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Stats()),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
