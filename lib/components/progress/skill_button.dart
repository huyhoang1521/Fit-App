import 'package:flutter/material.dart';

class SkillButton extends StatelessWidget {
  final String option1, option2, option3;
  final Function press1, press2, press3;
  final bool op1, op2, op3;

  const SkillButton({
    Key key,
    this.op1,
    this.op2,
    this.op3,
    this.option1,
    this.option2,
    this.option3,
    this.press1,
    this.press2,
    this.press3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _fitWidth = (MediaQuery.of(context).size.width);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Container(
        height: size.height * .25,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.grey[400], //Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8, 30, 8),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: press1,
                child: Container(
                  height: 35,
                  width: .75 * _fitWidth,
                  decoration: BoxDecoration(
                      color: op1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      option1,
                      style: TextStyle(
                          color: op1
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: press2,
                child: Container(
                  height: 35,
                  width: .75 * _fitWidth,
                  decoration: BoxDecoration(
                      color: op2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      option2,
                      style: TextStyle(
                        color: op2
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: press3,
                child: Container(
                  height: 35,
                  width: .75 * _fitWidth,
                  decoration: BoxDecoration(
                      color: op3
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ]),
                  child: Center(
                    child: Text(
                      option3,
                      style: TextStyle(
                          color: op3
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
