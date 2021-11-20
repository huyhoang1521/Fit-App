import 'package:flutter/material.dart';

class FitnessGoal extends StatelessWidget {
  final String text;
  final IconData icon;
  final String userData;
  final Function press;
  final bool goal;
  const FitnessGoal({
    Key key,
    this.text,
    this.icon,
    this.userData,
    this.press,
    this.goal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _fitWidth = (MediaQuery.of(context).size.width) - 138;
    return GestureDetector(
      onTap: press,
      child: AnimatedContainer(
        width: goal ? _fitWidth : 55.0,
        height: 75.0,
        decoration: BoxDecoration(
            color: goal
                ? Theme.of(context).primaryColor
                : Theme.of(context)
                    .colorScheme
                    .secondary, //Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadiusDirectional.circular(5),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        alignment: Alignment.center,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(7.5, 0, 7.5, 0),
            child: Icon(
              icon,
              size: 40,
              color: goal
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).primaryColor,
            ),
          ),
          //SizedBox(width: goal ? 5 : 0),
          Flexible(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  text,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
