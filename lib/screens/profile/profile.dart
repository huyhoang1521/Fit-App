import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/components/general/appbar/custom_appbar.dart';
import '../../components/general/drawer/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fit_app/components/themes/constants.dart';
import 'edit.dart';
import '../../components/profile/text_field_info.dart';
import '../../components/profile/main_goal.dart';
import '../../models/fit_user.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileState();
  }
}

String edit = 'Edit';
String uuid;
String fullName;
bool editButton = false;
FitUser user = new FitUser(
    null, null, null, null, null, null, null, null, null, null, null, null);

//Pulling from specific user data
final userData = FirebaseFirestore.instance.collection("Users");

Future<void> getUserInfo() async {
  var firebaseUser = FirebaseAuth.instance.currentUser;
  return await FirebaseFirestore.instance
      .collection("Users")
      .doc(firebaseUser.uid)
      .get()
      .then((newData) {
    user.goal = newData.data()['goal'];
    user.email = newData.data()['email'];
    user.length = newData.data()['length'];
    user.equipment = newData.data()['equipment'];
    user.primaryPushGoal = newData.data()['primaryPushGoal'];
    user.primaryPullGoal = newData.data()['primaryPullGoal'];
    user.firstName = newData.data()['firstName'];
    user.lastName = newData.data()['lastName'];
    user.height = newData.data()['height'];
    user.weight = newData.data()['weight'];
    user.dob = newData.data()['dob'];
    uuid = firebaseUser.uid;
    fullName = user.firstName + " " + user.lastName;
  });
}

Future<void> updateGoal(String goal) async {
  await userData.doc(uuid).update({"goal": goal});
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
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
                          color: editButton
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
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
