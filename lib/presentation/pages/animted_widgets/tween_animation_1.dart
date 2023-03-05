import 'package:app_ui/core/helper/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../../core/resources/app_constant.dart';

class TweenAnimation1 extends StatelessWidget {
  const TweenAnimation1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: const Duration(seconds: 1),
                child: Text(
                  'Moncef zer',
                  style: context.headline4,
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, -200 * value),
                    child: child,
                  );
                },
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    AppConstant.logoImg,
                  ),
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(200 * value, 0.0),
                    child: child,
                  );
                },
              ),
              const SizedBox(height: 15),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 900),
                curve: Curves.bounceOut,
                child: Text(
                  lorem(paragraphs: 1, words: 60),
                  style: context.headline4,
                ),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0.0, 300.0 * value),
                    child: child,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
