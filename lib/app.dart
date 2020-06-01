import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Fit App",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Fit App"),
            ),
            body: Center(child: Text("Hello World!!"))));
  }
}
