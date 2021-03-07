import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Fit With Nick',
        style: Theme.of(context).textTheme.headline4,
      ),
      elevation: 5,
    );
  }
}

//Appbar with a shadow

// PreferredSize(
// preferredSize: Size.fromHeight(kToolbarHeight),
// child: Container(
// decoration: BoxDecoration(boxShadow: [
// BoxShadow(
// color: Theme.of(context).shadowColor,
// spreadRadius: 2,
// blurRadius: 4,
// offset: Offset(0, 2),
// )
// ]),
// child: AppBar(
// title: Text('Fit For Life'),
// elevation: 10,
// ),
// ),
// ),
