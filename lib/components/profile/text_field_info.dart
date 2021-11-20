import '../general/icons/custom_icons_icons.dart';
import '../general/icons/iconicks_icons.dart';
import 'profile_text_box.dart';
import 'package:flutter/material.dart';
import '../../models/fit_user.dart';

class TextFieldInfo extends StatefulWidget {
  final FitUser user;
  final String fullName;

  const TextFieldInfo({Key key, this.user, this.fullName}) : super(key: key);
  @override
  _TextFieldInfo createState() =>
      new _TextFieldInfo(user: this.user, fullName: this.fullName);
}

class _TextFieldInfo extends State<TextFieldInfo> {
  final FitUser user;
  final String fullName;

  _TextFieldInfo({this.user, this.fullName});

  String userData;

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: fullName);
    final weightController =
        TextEditingController(text: user.weight.toString());
    final heightController = TextEditingController(text: user.height);
    final dobController = TextEditingController(text: user.dob);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ProfileTextBox(
          text: 'Name: ',
          icon: Icons.person_outline,
          userData: '$user.firstName $user.lastName',
          controller: nameController,
          enabled: false,
        ),
        ProfileTextBox(
          text: 'Weight: ',
          icon: CustomIcons.weight,
          userData: user.weight.toString(),
          controller: weightController,
          enabled: false,
        ),
        ProfileTextBox(
          text: 'Height: ',
          icon: CustomIcons.height,
          userData: user.height,
          controller: heightController,
          enabled: false,
        ),
        ProfileTextBox(
          text: 'Birth Date: ',
          icon: Iconicks.birthday2,
          userData: user.dob,
          controller: dobController,
          enabled: false,
        ),
      ],
    );
  }
}
