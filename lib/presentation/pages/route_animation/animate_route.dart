import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class SlideRight extends PageRouteBuilder {
  final Widget page;
  SlideRight({required this.page})
      : super(
          pageBuilder: (context, animation, animationTwo) => page,
          transitionsBuilder: (context, animation, animationTwo, child) {
            //! Slide transition
            //* 1 - combine two tweens
            var begin = const Offset(1, 0);
            var end = Offset.zero;
            // var tween = Tween(begin: begin, end: end);
            var curve = Curves.ease;
            var curveTween = CurveTween(curve: curve);
            var tween = Tween(begin: begin, end: end).chain(curveTween);
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );

            //* 2 - with CurvedAnimation
            // var curvedAnimation = CurvedAnimation(
            //     parent: animation, curve: Curves.linearToEaseOut);
            // return SlideTransition(
            //   position: tween.animate(curvedAnimation),
            //   child: child,
            // );

            //! scale Trasition
            // Tween<double> tween = Tween(begin: 0, end: 1.0); //* scale factor
            // CurvedAnimation curvedAnimation =
            //     CurvedAnimation(parent: animation, curve: Curves.easeInOut);
            // return ScaleTransition(
            //   scale: tween.animate(curvedAnimation),
            //   child: child,
            // );
            //! rotation transition
            // Tween<double> tween = Tween(begin: 0, end: 1); //* rotation factor
            // CurvedAnimation curvedAnimation =
            //     CurvedAnimation(parent: animation, curve: Curves.easeIn);
            // return RotationTransition(
            //     turns: tween.animate(curvedAnimation), child: child);

            //! size transition
            // return Align(
            //   alignment: Alignment.center, //* we can change the Aligment.
            //   child: SizeTransition(
            //     sizeFactor: animation,
            //     child: child,
            //   ),
            // );

            //! Fade transition
            // return FadeTransition(opacity: animation, child: child);

            //! merge transitons : ex size with fade
            // Tween<double> tween = Tween(begin: 0, end: 1); //* rotation factor
            // CurvedAnimation curvedAnimation =
            //     CurvedAnimation(parent: animation, curve: Curves.easeIn);

            // return Align(
            //   alignment: Alignment.center, //* we can change the Aligment.
            //   child: SizeTransition(
            //     sizeFactor: animation,
            //     child: FadeTransition(opacity: animation, child: child),
            //   ),
            // );
          },
        );
}
