import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, gif;
  const Description({Key key, this.name, this.description, this.gif})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(gif),
          Text(
            name,
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
              child: Text(
            description,
            style: Theme.of(context).textTheme.bodyText1,
          )),
        ],
      ),
    );
  }
}
