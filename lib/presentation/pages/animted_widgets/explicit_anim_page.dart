import 'package:flutter/material.dart';

class ExplicitAnimPage extends StatefulWidget {
  const ExplicitAnimPage({super.key});

  @override
  State<ExplicitAnimPage> createState() => _ExplicitAnimPageState();
}

class _ExplicitAnimPageState extends State<ExplicitAnimPage>
    with SingleTickerProviderStateMixin {
  //* with one animationController we use [SingleTickerProviderStateMixin]
  //* with more then one animationController we use [TickerProviderStateMixin]
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //* addStatusListener : state => {  }   , two state E {AnimationStatus.completed, AnimationStatus.forward...}
    //* addListener : () => {} , will be trigered with every change in animation
    // cuz animation duration [begin: , end: ] will be devided into parts depends of
    // freqency of rendering
    _animation = Tween(begin: 0, end: 3.14 * 2).animate(_controller)
      ..addStatusListener((status) {
        print(status);
      })
      ..addListener(() {
        setState(() {});
        print('listen ${_animation.value}');
      });

    //* forward() : go from begin => end
    //* reverse() : go from end => begin
    //* repeat()  || reate(revers : true)

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Transform.rotate(
          angle: _animation.value,
          child: Container(
            height: 200,
            width: 200,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
