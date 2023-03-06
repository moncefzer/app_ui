import 'package:flutter/material.dart';

class ShinyButtonPage extends StatelessWidget {
  const ShinyButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shiny Button'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ShinyButton(
              child: Text('Test Button'),
              color: Colors.amber,
            ),
            SizedBox(height: 20),
            ShinyButton(
              child: Text('Hello World'),
              color: Colors.teal,
            ),
            SizedBox(height: 20),
            ShinyButton(
              child: Text('Hello World2'),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class ShinyButton extends StatefulWidget {
  const ShinyButton({
    Key? key,
    required this.child,
    required this.color,
  }) : super(key: key);

  final Widget child;

  final Color color;

  @override
  State<ShinyButton> createState() => _ShinyButtonState();
}

class _ShinyButtonState extends State<ShinyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Tween(begin: 0.0, end: 1.0).animate(_animationController),
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                widget.color,
                Colors.white.withAlpha(255),
                widget.color,
              ],
              stops: [0.0, _animationController.value, 1.0],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}
