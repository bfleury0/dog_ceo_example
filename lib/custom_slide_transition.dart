import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///Animation used for switching screens
class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition(
      {super.key, required super.child, bool leftToRight = false})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            double offSet = 1.5;
            if (leftToRight) {
              offSet = -1.5;
            }
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: Offset(offSet, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.ease),
                ),
              ),
              child: child,
            );
          },
        );
}
