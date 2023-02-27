import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {
  TransformPage({super.key});

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  double slidVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('transfrom'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* we can specify the origin in all comming transformations : Offset(100,100)
          //! transfrom scale
          // Center(
          //   child: Transform.scale(
          //     scale: 2,
          //     child: box,
          //   ),
          // ),
          //! transfrom translate
          // Center(
          //   child: Transform.translate(
          //     offset: Offset(100, 10), // 100double => , 10 ^
          //     child: box,
          //   ),
          // ),
          //! transfrom rotate
          // Center(
          //   child: Transform.rotate(
          //     origin: Offset(0, -100),
          //     angle: slidVal, // with radian 90deg
          //     child: box,
          //   ),
          // ),
          // Text('${(180 * slidVal / 3.14).floor()}'),
          // Slider(
          //   min: 0,
          //   max: 3.14 * 2,
          //   value: slidVal,
          //   onChanged: (value) {
          //     setState(() {
          //       slidVal = value;
          //     });
          //   },
          // )
          //! transform
          // Center(
          //   child: Transform(
          //     transform: Matrix4.rotationZ(0.6)
          //       ..scale(2.0), // * we can compose rotations
          //     child: box,
          //   ),
          // )
        ],
      ),
    );
  }

  Widget box = Container(
    width: 100,
    height: 200,
    color: Colors.red,
  );
}
