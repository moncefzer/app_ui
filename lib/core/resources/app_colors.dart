import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color blue = Color.fromRGBO(0, 149, 246, 1);
  static const Color green = Color.fromARGB(255, 33, 215, 197);
  static const Color red = Colors.red;
  static const Color grey = Color(0xffDFDFDF);
  static const Color mainText = Color(0xff848484);
  static Color? teal = Colors.teal[400];
  static const LinearGradient linearBgColor = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomRight,
    colors: [
      Colors.purple,
      Colors.pink,
      Colors.orange,
    ],
  );
}
