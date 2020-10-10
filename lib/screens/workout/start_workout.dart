import 'package:fit_app/widgets/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StartWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        width: _width,
        height: _height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: getWorkout(context),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Press button to start.');
                  case ConnectionState.active:

                  case ConnectionState.waiting:
                    return Text('Awaiting result...');
                  case ConnectionState.done:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    else if (snapshot.hasData && snapshot.data != null) {
                      print("has data");

                      return ListView(
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[700],
                              child: Text("uid: " + '${snapshot.data['uid']}')),
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[600],
                              child:
                                  Text("goal: " + '${snapshot.data['goal']}')),
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[500],
                              child: Text(
                                  "length: " + '${snapshot.data['length']}')),
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[400],
                              child: Text("restTime: " +
                                  '${snapshot.data['restTime']}')),
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[300],
                              child: Text("coolDown: " +
                                  '${snapshot.data['coolDown']}')),
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[200],
                              child: Text("exercises[0]: " +
                                  '${snapshot.data['exercises'][0]}')),
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[100],
                              child: Text("exercises[1]: " +
                                  '${snapshot.data['exercises'][1]}')),
                          Container(
                              height: 50,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.amber[50],
                              child: Text("exercises[2]: " +
                                  '${snapshot.data['exercises'][2]}')),
                        ],
                      );
                    } else if (snapshot.data == null) {
                      print("null");
                      return Text('Result: ${snapshot.data}');
                    }
                }
                return null; // unreachable
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<DocumentSnapshot> getWorkout(BuildContext context) async {
    final uid = await ProviderWidget.of(context).auth.getCurrentUID();
    return await FirebaseFirestore.instance
        .collection("Workouts")
        .doc(uid)
        .get();
  }
}
