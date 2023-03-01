import 'package:flutter/material.dart';

//* Ticker :  is like a clock every Tick we get a new animation value
//* so only when our widget is on the screen the animation will tick
//* so our widget become a ticker fro the animation

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    //! Create ColorTween animation
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_curve); //  _controller will controll ColorTween

    //! Create Size aniamtion
    //* 1- Use a simple Tween : has begin - end
    // _sizeAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
    //* 2- Tween sequence items : has begin0 - end0, begin1-end1 ,....
    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(_curve);
    //* replace _controller by _curve to add curves affect and (_curve uses _controller as parent under the hood)

    // _controller.forward();
    //* will fire every time our _controller emit a new value [0,1] by default  : _controller.value
    _controller.addListener(() {
      // print(_controller.value);
      // print(_colorAnimation.value);
      // print(_sizeAnimation.value);
      //! we could use setState to flush out animation or use AnimationBuilder
      // setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //* with every change in controller the builder will re-run
      animation: _controller,
      //* (context,child) [child will be cached not rebuild every render]
      builder: (context, _) {
        return IconButton(
          icon: Transform.scale(
            scale: _sizeAnimation.value / 30,
            child: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: 30,
            ),
          ),
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
