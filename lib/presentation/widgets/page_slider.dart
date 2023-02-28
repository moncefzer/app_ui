import 'package:flutter/material.dart';

class PageSlider extends PageRouteBuilder {
  final Widget page;
  PageSlider({required this.page})
      : super(
          pageBuilder: (context, animation, animationTwo) => page,
          transitionsBuilder: (context, animation, animationTwo, child) {
            CurveTween curveTween = CurveTween(curve: Curves.easeInOut);
            Animatable<Offset> tween =
                Tween(begin: const Offset(1, 0), end: Offset.zero)
                    .chain(curveTween);

            Animation<Offset> offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
