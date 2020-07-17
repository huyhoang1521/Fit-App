import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/components/profile_info_text.dart';

class ProfileInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileInfoState();
  }
}

Future<DocumentSnapshot> getUserInfo() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser();
  return await Firestore.instance
      .collection("Users")
      .document(firebaseUser.uid)
      .get();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserInfo(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (!snapshot.hasData)
          return Text("Loading");
        else if (snapshot.hasError) {
          Column(children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ]);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileTextBox(
              text: 'Name: ', //document['firstName'],
              icon: Icons.person_outline,
              userData: snapshot.data.data['firstName'],
            ),
            ProfileTextBox(
              text: 'Weight: ',
              icon: CustomIcons.weight,
              userData: snapshot.data.data["weight"].toString(),
            ),
            ProfileTextBox(
              text: 'Height: ',
              icon: CustomIcons.height,
              userData: snapshot.data.data['firstName'],
            ),
            ProfileTextBox(
              text: 'Birth Date: ',
              icon: Icons.cake,
              userData: snapshot.data.data['dob'],
            ),
          ],
        );
      },
    );
  }
}
