import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fit_app/components/constants.dart';
import 'edit.dart';
import 'text_field_info.dart';
import 'main_goal.dart';
import '../../../models/user.dart';

class NewProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewProfileState();
  }
}

String edit = 'Edit';
String uuid;
String fullName;
bool editButton = false;
User user = new User(
    null, null, null, null, null, null, null, null, null, null, null, null);

//Pulling from specific user data
final userData = Firestore.instance.collection("Users");

Future<void> getUserInfo() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  return await Firestore.instance
      .collection("Users")
      .document(firebaseUser.uid)
      .get()
      .then((newData) {
    user.goal = newData.data['goal'];
    user.email = newData.data['email'];
    user.length = newData.data['length'];
    user.equipment = newData.data['equipment'];
    user.primaryPushGoal = newData.data['primaryPushGoal'];
    user.primaryPullGoal = newData.data['primaryPullGoal'];
    user.firstName = newData.data['firstName'];
    user.lastName = newData.data['lastName'];
    user.height = newData.data['height'];
    user.weight = newData.data['weight'];
    user.dob = newData.data['dob'];
    uuid = firebaseUser.uid;
    fullName = user.firstName + " " + user.lastName;
  });
}

Future<void> updateGoal(String goal) async {
  await userData.document(uuid).updateData({"goal": goal});
}

class _NewProfileState extends State<NewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fit With Nick!'),
        elevation: 5,
      ),
      body: FutureBuilder(
        future: getUserInfo(),
        builder: (context, snapshot) {
          return ListView(
            padding: const EdgeInsets.all(4),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Profile Info',
                      style: Theme.of(context).textTheme.headline1),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      elevation: 2,
                      child: Text(
                        edit,
                        style: TextStyle(
                          color: editButton ? Colors.white : kPrimaryColor,
                        ),
                        //Theme.of(context).textTheme.bodyText1,
                      ),
                      color: editButton
                          ? kPrimaryColor
                          : Theme.of(context)
                              .accentColor, //Theme.of(context).accentColor,
                      disabledColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Edit(user: user, uuid: uuid)),
                        );
                      },
                    ),
                  ),
                ],
              ),
              TextFieldInfo(user: user, fullName: fullName),
              SizedBox(height: newSect),
              //Goals(user: user),
              SizedBox(height: newSect),
              MainGoal(user: user),
            ],
          );
        },
      ),
    );
  }
}
