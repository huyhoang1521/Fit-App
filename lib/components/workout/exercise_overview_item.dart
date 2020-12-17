import 'dart:core';
import 'package:flutter/material.dart';

class ExerciseOverviewItem extends StatelessWidget {
  final Function onPressed;
  final bool enabled;
  final String name;
  final String img;
  final int time;
  const ExerciseOverviewItem({
    Key key,
    this.name,
    this.img,
    this.time,
    this.enabled,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GestureDetector(
        onLongPress: onPressed,
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
}
