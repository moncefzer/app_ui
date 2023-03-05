import 'package:app_ui/core/helper/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TweenAnimation2 extends StatefulWidget {
  const TweenAnimation2({super.key});

  @override
  State<TweenAnimation2> createState() => _TweenAnimation2State();
}

class _TweenAnimation2State extends State<TweenAnimation2> {
  int counter = 0;
  int? oldCounter;
  @override
  Widget build(BuildContext context) {
    print('big build');
    var textStyle = const TextStyle(fontSize: 80);
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            key: Key(counter.toString()),
            duration: const Duration(milliseconds: 350),
            builder: (context, value, child) {
              print('builder');
              return Stack(
                children: [
                  if (oldCounter != null)
                    Opacity(
                      opacity: 1 - value,
                      child: Transform.translate(
                        offset: Offset(50 * value, 0.0),
                        child: Text(
                          '$oldCounter',
                          style: textStyle,
                        ),
                      ),
                    ),
                  Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(-50 * (1 - value), 0.0),
                      child: Text(
                        '$counter ',
                        style: textStyle,
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          oldCounter = counter;
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
