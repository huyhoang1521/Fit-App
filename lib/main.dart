import 'package:fit_app/providers/workout_file_data.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/workout_process.dart';
import 'package:fit_app/screens/test_screens/test_page.dart';
import 'package:fit_app/screens/workout/complete.dart';
import 'package:fit_app/screens/workout/cool_down.dart';
import 'package:fit_app/screens/workout/exercise_page.dart';
import 'package:fit_app/screens/workout/rest.dart';
import 'package:fit_app/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/providers/auth_service.dart';
import 'package:fit_app/providers/provider_widget.dart';
import 'package:provider/provider.dart';
import 'components/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print("error");
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<WorkoutExercises>(
                  create: (_) => WorkoutExercises()),
              ChangeNotifierProvider<ThemeNotifier>(
                  create: (_) => ThemeNotifier()),
              ChangeNotifierProvider<WorkoutFileData>(
                  create: (_) => WorkoutFileData()),
              ChangeNotifierProvider<WorkoutProcess>(
                  create: (_) => WorkoutProcess())
            ],
            child: ProviderWidget(
              auth: AuthService(),
              child: Consumer<ThemeNotifier>(
                builder: (context, ThemeNotifier notifier, child) {
                  return MaterialApp(
                    theme: notifier.darkTheme ? dark : light,
                    home: HomeController(),
                    routes: <String, WidgetBuilder>{
                      '/home': (BuildContext context) => HomeController(),
                      '/restPage': (BuildContext context) => RestPage(),
                      '/exercisePage': (BuildContext context) => ExercisePage(),
                      '/coolDown': (BuildContext context) => CoolDown(),
                      '/complete': (BuildContext context) => Complete(),
                    },
                  );
                },
              ),
            ),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class HomeController extends StatefulWidget {
  @override
  _HomePicker createState() => new _HomePicker();
}

class _HomePicker extends State<HomeController> {
  bool workoutInProgress;

  @override
  Widget build(BuildContext context) {
    final AuthService auth = ProviderWidget.of(context).auth;
    final workoutFileData = Provider.of<WorkoutFileData>(context);

    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          if (signedIn) {
            if (workoutFileData.dataWritten == true) {
              return HomePage();
            }
          } else {
            //return FirstView();
            return TestPage();

          }
        }
        return CircularProgressIndicator();
      },
    );
  }
}
