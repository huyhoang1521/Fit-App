import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Function rWPressed, pPPressed, fFPressed;
  final bool enabled;
  const Buttons({
    Key key,
    this.enabled,
    this.rWPressed,
    this.pPPressed,
    this.fFPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData pause = Icons.pause_circle_filled;
    IconData play = Icons.play_circle_filled;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.fast_rewind),
            onPressed: rWPressed,
            iconSize: 75,
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColor,
          ),
          IconButton(
            icon: Icon(enabled ? pause : play),
            color: Theme.of(context).primaryColor,
            onPressed: pPPressed,
            iconSize: 75,
          ),
          IconButton(
            icon: Icon(Icons.fast_forward),
            onPressed: fFPressed,
            iconSize: 75,
            color: Theme.of(context).primaryColor,
            disabledColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
