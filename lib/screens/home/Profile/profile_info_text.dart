import 'package:flutter/material.dart';

class ProfileTextBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final String userData;
  final Function press;
  final bool enabled;
  final TextEditingController controller;
  const ProfileTextBox({
    Key key,
    this.text,
    this.enabled,
    this.icon,
    this.userData,
    this.press,
    this.controller,
    //this.controller,
  }) : super(key: key);

  // final controller = TextEditingController(text: 'NickyP');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5),
//            boxShadow: [
//              BoxShadow(
//                color: Colors.grey.withOpacity(0.5),
//                spreadRadius: 2, //2
//                blurRadius: 3, //2,
//                offset: Offset(0, 2), // changes position of shadow
//              ),
//            ]
        ),
        child: Row(children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          new Flexible(
            child: TextFormField(
              enabled: enabled,
              controller:
                  controller, //TextEditingController()..text = userData,
              style: Theme.of(context).textTheme.bodyText2,
              onChanged: press,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
