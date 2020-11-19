import 'dart:core';
import 'package:flutter/material.dart';

class ExercisePercentItem extends StatelessWidget {
  final Function onPressed;
  final bool enabled;
  final String name;
  final int percent;
  const ExercisePercentItem({
    Key key,
    this.name,
    this.percent,
    this.enabled,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          height: 100,
          child: Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headline4,
                ),
                Row(
                  children: [
                    Text(
                      percent.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '  %',
                      style: Theme.of(context).textTheme.headline4,
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
}
