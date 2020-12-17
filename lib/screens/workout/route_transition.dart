import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget page;
  final Offset start, end;
  RouteTransition({this.page, this.start, this.end})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              // FadeTransition(
              //   opacity: animation,
              //   child: child,
              // )
              SlideTransition(
            position: Tween<Offset>(
              begin: start,
              end: end,
            ).animate(animation),
            child: child,
          ),
        );
}

// @override
// Widget buildTransitions(BuildContext context, Animation<double> animation,
//     Animation<double> secondaryAnimation, Widget child) {
//   final PageTransitionsTheme theme = Theme.of(context).pageTransitionsTheme;
//   Animation<double> onlyForwardAnimation;
//   switch (animation.status) {
//     case AnimationStatus.reverse:
//     case AnimationStatus.dismissed:
//       onlyForwardAnimation = kAlwaysCompleteAnimation;
//       break;
//     case AnimationStatus.forward:
//     case AnimationStatus.completed:
//       onlyForwardAnimation = animation;
//       break;
//   }
//   return theme.buildTransitions<RouteTransition>(
//       this, context, onlyForwardAnimation, secondaryAnimation, child);
// }
