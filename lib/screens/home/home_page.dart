import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_file_data.dart';
import 'package:fit_app/providers/workout_process.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/providers/auth_service.dart';
import 'package:fit_app/providers/provider_widget.dart';
import 'package:provider/provider.dart';

JsonData jsonData = new JsonData('workoutData.json');

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

Widget exerciseOverviewItem(
    //Function onPressed,
    //bool enabled,
    String name,
    String img,
    int time,
    BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: GestureDetector(
      //onLongPress: onPressed,
      child: SizedBox(
        height: 100,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            time.toString(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            '  minutes',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(img),
            ],
          ),
        ),
      ),
    ),
  );
}

class _HomePage extends State<HomePage> {
  List<Map<String, dynamic>> completeList = new List();
  @override
  Widget build(BuildContext context) {
    final workoutProcess = Provider.of<WorkoutProcess>(context);
    final workoutExercises = Provider.of<WorkoutExercises>(context);

    // Get the warmup and progression lists from their respective collections
    if (jsonData.getFileExists() == true && jsonData.getFileContent() != null) {
      completeList =
          List<Map<String, dynamic>>.from(jsonData.getFileContent()['warmup']) +
              List<Map<String, dynamic>>.from(
                  jsonData.getFileContent()['progressions']);
    }

    final workoutFileData = Provider.of<WorkoutFileData>(context);
    String workoutButtonText = '';

    if (workoutProcess.workoutInProgress == true) {
      workoutButtonText = "Resume workout: " +
          (workoutProcess.exerciseCount + 1).toString() +
          "/" +
          completeList.length.toString();
    } else {
      workoutButtonText = 'Start Workout';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit With Nick'),
        elevation: 5,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.undo),
            color: Theme.of(context).iconTheme.color,
            onPressed: () async {
              try {
                workoutFileData.setGetWorkout(false);
                AuthService auth = ProviderWidget.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print(e);
              }
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.timer,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "57 minutes",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: ListView.builder(
                    itemCount: completeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return exerciseOverviewItem(completeList[index]['name'],
                          'assets/images/pullup_up.png', 5, context);
                    },
                  ),
                ),
              ),
            ),
            // TODO - Set logic to route to coolDown. Since exercise count may be greater than the exercises
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RoundedButton(
                color: Theme.of(context).buttonColor,
                press: () async {
                  workoutExercises.setExerciseList(
                      List<Map<String, dynamic>>.from(
                          jsonData.getFileContent()['exercises']));
                  workoutExercises.setProgressionList(
                      List<Map<String, dynamic>>.from(
                          jsonData.getFileContent()['progressions']));
                  workoutExercises.setWarmupList(
                      List<Map<String, dynamic>>.from(
                          jsonData.getFileContent()['warmup']));

                  workoutProcess.setWorkoutInProgress(true);
                  workoutExercises.setListsNotSet(true);
                  Navigator.pushNamed(context, '/exercisePage');
                },

                text: workoutButtonText,
                //onLongPress: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
