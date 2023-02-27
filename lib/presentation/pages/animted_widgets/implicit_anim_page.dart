import 'package:flutter/material.dart';

class ImpliciteAnimPage extends StatefulWidget {
  const ImpliciteAnimPage({super.key});

  @override
  State<ImpliciteAnimPage> createState() => _ImpliciteAnimPageState();
}

class _ImpliciteAnimPageState extends State<ImpliciteAnimPage> {
  double height = 200;
  double width = 200;
  Color color = Colors.orange;
  double radius = 10;
  bool showFirst = true;
  final Duration duration = const Duration(milliseconds: 300);
  double opacity = 1.0;
  BoxShape shape = BoxShape.circle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! Animated Size
            // Center(
            //   child: AnimatedSize(
            //     duration: Duration(seconds: 1),
            //     child: Container(
            //       height: height,
            //       width: width,
            //       color: Colors.orange,
            //       alignment: Alignment.center,
            //       child: Text('Hello'),
            //     ),
            //   ),
            // ),
            //! AnimatedContainer
            //* all properties will be affected with that animation
            // Center(
            //   child: AnimatedContainer(
            //     duration: Duration(milliseconds: 300),
            //     curve: Curves.easeInOut,
            //     height: height,
            //     width: width,
            //     decoration: BoxDecoration(
            //       color: color,
            //       borderRadius: BorderRadius.circular(radius),
            //     ),
            //     alignment: Alignment.center,
            //     child: Text('Hello'),
            //   ),
            // ),
            //! AnimatedCrossFage
            // AnimatedCrossFade(
            //   firstChild: Container(
            //     height: height,
            //     width: width,
            //     color: Colors.orange,
            //     alignment: Alignment.center,
            //     child: Text('One'),
            //   ),
            //   secondChild: Container(
            //     height: height - 10,
            //     width: width - 10,
            //     color: Colors.green,
            //     alignment: Alignment.center,
            //     child: Text('Two'),
            //   ),
            //   crossFadeState: showFirst
            //       ? CrossFadeState.showFirst
            //       : CrossFadeState.showSecond,
            //   duration: Duration(milliseconds: 300),
            //   firstCurve: Curves.easeInOut,
            //   secondCurve: Curves.easeInOut,
            // ),
            //! AnimatedDefautTextStyle
            //* all properties of TextStyle of Text Elment in subtree , will be animated
            // AnimatedDefaultTextStyle(
            //   style: TextStyle(color: color),
            //   duration: duration,
            //   child: Column(
            //     children: const [
            //       Text('Hello'),
            //       Text('World!'),
            //     ],
            //   ),
            // ),
            //! AnimatedPadding
            // Container(
            //   color: color,
            //   child: AnimatedPadding(
            //     duration: duration,
            //     padding: EdgeInsets.all(radius),
            //     child: Text('test'),
            //   ),
            // ),
            //! AnimatedOpacity
            // AnimatedOpacity(
            //   opacity: opacity,
            //   duration: duration,
            //   child: Text('test'),
            // ),
            //
            //! AnimatedPhysicalModel
            //* just shape will not be animated
            // AnimatedPhysicalModel(
            //   shape: shape,
            //   elevation: radius,
            //   color: color,
            //   shadowColor: color,
            //   duration: duration,
            //   child: box,
            // ),
            //! Animted positon :
            //* inside stack + take care of child size
            //* it's better if we use TransitionSlide
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (color == Colors.green) {
                    radius = 0;
                    color = Colors.orange;
                    return;
                  }
                  radius = 20;
                  color = Colors.green;
                });
              },
              child: const Text('Triger animation'),
            )
          ],
        ),
      ),
    );
  }

  Widget box = Container(
    height: 200,
    width: 200,
  );
}
