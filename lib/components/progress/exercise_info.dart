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
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum maximus libero id odio tincidunt, ut maximus nisi congue. Donec pellentesque elit ex. Ut pulvinar massa ut risus suscipit, eget scelerisque lorem vulputate. Integer eget quam at tellus vulputate varius eget in mi. Nam nec enim maximus, pharetra orci non, ullamcorper nunc. Suspendisse at eleifend enim. Ut vitae augue eleifend, gravida augue sed, dignissim leo. Praesent eget malesuada leo.",
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