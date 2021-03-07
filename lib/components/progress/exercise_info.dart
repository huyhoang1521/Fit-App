import 'package:flutter/material.dart';

 class ExerciseInfo extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
    double _height = (MediaQuery.of(context).size.height);
     return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: _height*.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tier:',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Fundamental',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Muscle Group:',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Pull',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Contraction Type:',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Concentric',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Position:',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Vertical',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Start in plank postion with arms straight and hands shoulder width apart and rings turned out with palms facing forward. Slowly lower body down by bending one arm while keeping the other arm as straight as possible. Lower until chest reaches hands and then push explosively until in starting position. Repeat and switch roles of arms. Keep body as straight as possible for duration of exercise by squezing glutes and keeping core engaged. ",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
   
   }
 }