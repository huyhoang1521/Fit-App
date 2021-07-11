import 'package:fit_app/algorithms/json/json_data.dart';
import 'package:fit_app/components/general/buttons/rounded_button.dart';
import 'package:fit_app/components/general/drawer/app_drawer.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_file_data.dart';
import 'package:fit_app/providers/workout_process.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/providers/auth_service.dart';
import 'package:fit_app/providers/provider_widget.dart';
import 'package:provider/provider.dart';

JsonData jsonData = new JsonData('workoutData.json');

class WorkoutOverview extends StatefulWidget {
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

Widget exerciseFolderItem(String section, int time, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
    child: SizedBox(
      height: 100,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[900],
            border: Border(bottom: BorderSide(color: Colors.black, width: 5))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    section,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
              Row(
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
            ],
          ),
        ),
      ),
    ),
  );
}

class _HomePage extends State<WorkoutOverview> with TickerProviderStateMixin {
  AnimationController _warmUpController;
  Animation<double> _warmUpAnimation;
  bool _expandWarmUp = false;
  AnimationController _mainController;
  Animation<double> _mainAnimation;
  bool _expandMain = false;
  AnimationController _coolDownController;
  Animation<double> _coolDownAnimation;
  bool _expandCoolDown = false;

  @override
  void initState() {
    super.initState();
    _warmUpController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _warmUpAnimation = CurvedAnimation(
      parent: _warmUpController,
      curve: Curves.fastOutSlowIn,
    );

    _mainController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _mainAnimation = CurvedAnimation(
      parent: _mainController,
      curve: Curves.fastOutSlowIn,
    );

    _coolDownController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _coolDownAnimation = CurvedAnimation(
      parent: _coolDownController,
      curve: Curves.fastOutSlowIn,
    );
  }

  _expandWarm() {
    if (_expandWarmUp) {
      _warmUpController.forward();
    } else {
      _warmUpController.reverse();
    }
  }

  _expandMa() {
    if (_expandMain) {
      _mainController.forward();
    } else {
      _mainController.reverse();
    }
  }

  _expandCool() {
    if (_expandCoolDown) {
      _coolDownController.forward();
    } else {
      _coolDownController.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _warmUpController.dispose();
    _mainController.dispose();
    _coolDownController.dispose();
  }

  List<Map<String, dynamic>> completeList = new List();
  List<Map<String, dynamic>> warmupList = new List();
  List<Map<String, dynamic>> mainList = new List();

  @override
  Widget build(BuildContext context) {
    double _height = (MediaQuery.of(context).size.height);
    final workoutProcess = Provider.of<WorkoutProcess>(context);
    final workoutExercises = Provider.of<WorkoutExercises>(context);

    // Get the warmup and progression lists from file
    if (jsonData.getFileExists() == true && jsonData.getFileContent() != null) {
      completeList =
          List<Map<String, dynamic>>.from(jsonData.getFileContent()['warmup']) +
              List<Map<String, dynamic>>.from(
                  jsonData.getFileContent()['exercises']);
    }

    if (jsonData.getFileExists() == true && jsonData.getFileContent() != null) {
      warmupList =
          List<Map<String, dynamic>>.from(jsonData.getFileContent()['warmup']);
    }
    if (jsonData.getFileExists() == true && jsonData.getFileContent() != null) {
      mainList = List<Map<String, dynamic>>.from(
          jsonData.getFileContent()['exercises']);
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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 8, 36),
              child: Text(
                "Today's Workout",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _expandWarmUp = !_expandWarmUp;
                  });
                  _expandWarm();
                },
                child: exerciseFolderItem('Warm Up', 10, context)),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: _warmUpAnimation,
              child: Container(
                // duration: Duration(milliseconds: 500),
                height: (warmupList.length.toDouble() * 100) + 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: warmupList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return exerciseOverviewItem(warmupList[index]['name'],
                          'assets/images/pullup_up.png', 5, context);
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _expandMain = !_expandMain;
                  });
                  _expandMa();
                },
                child: exerciseFolderItem('Main Exercises', 26, context)),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: _mainAnimation,
              child: Container(
                // duration: Duration(milliseconds: 500),
                height: (mainList.length.toDouble() * 100) + 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mainList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return exerciseOverviewItem(mainList[index]['name'],
                          'assets/images/pullup_up.png', 5, context);
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    _expandCoolDown = !_expandCoolDown;
                  });
                  _expandCool();
                },
                child: exerciseFolderItem('Cool Down', 15, context)),
            SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: _coolDownAnimation,
              child: Container(
                // duration: Duration(milliseconds: 500),
                height: mainList.length.toDouble() * 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mainList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return exerciseOverviewItem(mainList[index]['name'],
                          'assets/images/pullup_up.png', 5, context);
                    },
                  ),
                ),
              ),
            ),
            // TODO - Set logic to route to coolDown. Since exercise count may be greater than the exercises
            SizedBox(
              height: _height * .01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Time:'),
                  Text('45 mins'),
                ],
              ),
            ),
            SizedBox(
              height: _height * .01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RoundedButton(
                color: Theme.of(context).buttonColor,
                press: () {
                  workoutProcess.setWorkoutInProgress(true);
                  workoutExercises.setListsNotSet(true);
                  Navigator.pushNamed(context, '/exercisePage');
                },
                text: workoutButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}