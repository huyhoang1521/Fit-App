import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create Trip - Location')),
        body: Container(
          child: Text("Enter A Location"),
        ));
  }
}
