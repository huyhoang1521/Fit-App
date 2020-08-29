import 'package:fit_app/components/themes/icons/custom_icons_icons.dart';
import 'package:fit_app/components/themes/icons/iconicks_icons.dart';
import 'package:fit_app/screens/home/Profile/profile_test_page.dart';
import 'package:flutter/material.dart';
import 'package:fit_app/screens/home/Profile/profile_info_text.dart';

String goal;
String fullName = '$firstName $lastName';

class ProfileInfo extends StatelessWidget {
  final String userData, firstName, lastName, dob;
  final int weight, height;
  final bool lock;
  final Function onChangeFN, onChangeLN, onChangeW, onChangeH, onChangeD;
  final TextEditingController nameController,
      weightController,
      heightController,
      dobController;
  const ProfileInfo({
    Key key,
    this.lock,
    this.nameController,
    this.weightController,
    this.heightController,
    this.dobController,
    this.userData,
    this.firstName,
    this.lastName,
    this.dob,
    this.height,
    this.weight,
    this.onChangeFN,
    this.onChangeLN,
    this.onChangeW,
    this.onChangeH,
    this.onChangeD,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProfileTextBox(
          text: 'Name: ',
          icon: Icons.person_outline,
          userData: firstName,
          press: onChangeFN,
          controller: nameController,
          enabled: lock,
        ),
        ProfileTextBox(
          text: 'Weight: ',
          icon: CustomIcons.weight,
          userData: weight.toString(),
          press: onChangeLN,
          controller: weightController,
          enabled: lock,
        ),
        ProfileTextBox(
          text: 'Height: ',
          icon: CustomIcons.height,
          userData: height.toString(),
          press: onChangeH,
          controller: heightController,
          enabled: lock,
        ),
        ProfileTextBox(
          text: 'Birth Date: ',
          icon: Iconicks.birthday2,
          userData: dob,
          press: onChangeD,
          controller: dobController,
          enabled: lock,
        ),
      ],
    );
  }
}
