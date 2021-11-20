import 'package:flutter/material.dart';

 class ExerciseInfo extends StatelessWidget {
  final String tier,exerciseType,movementType,position,description;

  const ExerciseInfo({
    Key key,
    this.tier,
    this.exerciseType,
    this.movementType,
    this.position,
    this.description,
  }) : super(key: key);

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
                    tier,
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
                    exerciseType,
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
                    movementType,
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
                    position,
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
                description,
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