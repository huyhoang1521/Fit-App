import 'package:flutter/material.dart';

class ExerciseTitle extends StatelessWidget {
  final String name;
  const ExerciseTitle({
    Key key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(name, style: Theme.of(context).textTheme.headline2),
          ),
        ),
      ),
    );
  }
}
