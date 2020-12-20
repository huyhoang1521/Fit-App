import 'package:fit_app/providers/account_created.dart';
import 'package:fit_app/providers/workout_exercises.dart';
import 'package:fit_app/providers/exercise_counter.dart';
import 'package:fit_app/providers/workout_in_progress.dart';
import 'package:fit_app/screens/home/home_picker.dart';
import 'package:fit_app/screens/home/json_home.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/providers/auth_service.dart';
import 'package:fit_app/providers/provider_widget.dart';
import 'package:provider/provider.dart';
import 'algorithms/json/json_data.dart';
import 'components/themes/theme.dart';
import 'screens/form/first_view.dart';
import 'screens/form/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {}
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ExerciseCounter>(
                  create: (_) => ExerciseCounter()),
              ChangeNotifierProvider<WorkoutExercises>(
                  create: (_) => WorkoutExercises()),
              ChangeNotifierProvider<ThemeNotifier>(
                  create: (_) => ThemeNotifier()),
              ChangeNotifierProvider<AccountCreated>(
                  create: (_) => AccountCreated()),
              ChangeNotifierProvider<WorkoutInProgress>(
                  create: (_) => WorkoutInProgress())
            ],
            child: ProviderWidget(
              auth: AuthService(),
              child: Consumer<ThemeNotifier>(
                builder: (context, ThemeNotifier notifier, child) {
                  return MaterialApp(
                    theme: notifier.darkTheme ? dark : light,
                    home: HomeController(),
                    routes: <String, WidgetBuilder>{
                      '/signIn': (BuildContext context) => SignIn(),
                      '/home': (BuildContext context) => HomeController(),
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
    JsonData jsonData = new JsonData('workoutData.json');
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          if (signedIn) {
            //final accountCreated = Provider.of<AccountCreated>(context);
            if (jsonData.getFileExists()) {
              return JsonHome();
            } else {
              return HomePicker();
            }
          } else {
            return FirstView();
          }

          //return signedIn ? HomePicker() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
