import 'package:coast/coast.dart';
import 'package:flutter/material.dart';

///This is for transitions between crabs
Widget textFlightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  BeachTransitionDirection direction,
  BuildContext fromCrabContext,
  BuildContext? toCrabContext,
) {
  final curvedAnimation =
      CurvedAnimation(parent: animation, curve: Curves.easeInOutQuart);
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned(
        top: 0,
        left: 0,
        child: FadeTransition(
          opacity: Tween<double>(begin: 1, end: 0).animate(curvedAnimation),
          child: (fromCrabContext.widget as Crab).child,
        ),
      ),
      if (toCrabContext != null)
        Positioned(
          top: 0,
          left: 0,
          child: FadeTransition(
            opacity: curvedAnimation,
            child: (toCrabContext.widget as Crab).child,
          ),
        ),
    ],
  );
}
