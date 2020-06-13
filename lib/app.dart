import 'package:fit_app/tabsystem.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // Use the old theme but apply the following three changes
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Open Sans',
              bodyColor: Colors.black,
              displayColor: Colors.black)),
      home: TabSystem(),
    );
  }
}
