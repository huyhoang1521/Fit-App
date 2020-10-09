import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:fit_app/models/fit_user.dart';
import '../widgets/fitness_goal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fit_app/components/constants.dart';

class MainGoal extends StatefulWidget {
  final FitUser user;

  const MainGoal({Key key, this.user}) : super(key: key);
  @override
  _MainGoal createState() => new _MainGoal(user: this.user);
}

class _MainGoal extends State<MainGoal> {
  final FitUser user;

  _MainGoal({this.user});

  bool selected = false;
  bool editButton = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedOpacity(
          opacity: !editButton ? 1.0 : 0.2,
          duration: Duration(milliseconds: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedOpacity(
                opacity: !editButton ? 1.0 : 0.2,
                duration: Duration(milliseconds: 250),
                child: Text(
                  'Fitness Goal',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: titleDiv,
              ),
              AnimatedOpacity(
                opacity: !editButton ? 1.0 : 0.2,
                duration: Duration(milliseconds: 250),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FitnessGoal(
                        goal: user.goal == "Strength",
                        icon: Iconicks.strength1_1,
                        text: 'Strength',
                      ),
                      FitnessGoal(
                        goal: user.goal == "Hypertrophy",
                        icon: Iconicks.bodybuilder2,
                        text: 'Hypertrophy',
                      ),
                      FitnessGoal(
                        goal: user.goal == "Weight Loss",
                        icon: Iconicks.wl2,
                        text: 'Weight Loss',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: newSect),
            ],
          ),
        ),
      ],
    );
  }
}
