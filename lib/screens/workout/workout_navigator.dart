import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_app/algorithms/warmup.dart';
import 'package:fit_app/models/user_warmup.dart';
import 'package:fit_app/models/user_workout.dart';
import 'package:fit_app/screens/workout/workout_warmup.dart';
import 'package:flutter/material.dart';

import 'complete.dart';

bool warmupBool = true;
bool push = false;
bool pull = false;
bool coolDown = false;
Warmup warmup = new Warmup();

class WorkoutNavigator extends StatefulWidget {
  final UserWorkout workout;

  const WorkoutNavigator({Key key, this.workout}) : super(key: key);

  @override
  _WorkoutNavigatorState createState() =>
      new _WorkoutNavigatorState(workout: this.workout);
}

class _WorkoutNavigatorState extends State<WorkoutNavigator> {
  UserWorkout workout;
  _WorkoutNavigatorState({this.workout});

  Future<Widget> fetchUserWorkout() =>
      Future.delayed(Duration(seconds: 1), () async {
        debugPrint('Step 2, fetch data');
        DocumentSnapshot warmupDoc = await warmup.getWarmup(workout.warmup[0]);
        UserWarmup userWarmup = new UserWarmup(
            warmupDoc["name"],
            warmupDoc["id"],
            warmupDoc["category"],
            warmupDoc["subCategory"],
            warmupDoc["type"],
            warmupDoc["description"]);
        return WorkoutWarmup(userWarmup: userWarmup);
        ;
      });

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: fetchUserWorkout(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Build the widget with data.
            if (warmupBool) {
              return WorkoutWarmup(userWarmup: snapshot.data);
            } else if (pull) {
              return WorkoutWarmup(userWarmup: snapshot.data);
            } else if (push) {
              return WorkoutWarmup(userWarmup: snapshot.data);
            } else if (coolDown) {
              return WorkoutWarmup(userWarmup: snapshot.data);
            }
          }

          return Complete(workout: workout);
        },
      );
}
