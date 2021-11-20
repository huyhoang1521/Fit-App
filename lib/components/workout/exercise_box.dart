import 'package:flutter/material.dart';

class ExerciseBox extends StatelessWidget {
  final String name;
  final dynamic value;
  const ExerciseBox({
    Key key,
    this.name,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: Theme.of(context).textTheme.headline2),
                  Text(value.toString(),
                      style: Theme.of(context).textTheme.headline2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
