import 'package:flutter/material.dart';
import './app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
    // fontFamily: 'Inter',
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
    iconTheme: const IconThemeData(
      size: 25,
      color: AppColors.black,
    ),
    textTheme: lightTextTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(0.6),
    ),
    inputDecorationTheme: inputDecorationTheme(),
  );

  static ThemeData darkTheme = ThemeData();
}

//* NAME         SIZE  WEIGHT  SPACING
//* headline1    96.0  light   -1.5
//* headline2    60.0  light   -0.5
//* headline3    48.0  regular  0.0
//* headline4    34.0  regular  0.25
//* headline5    24.0  regular  0.0
//* headline6    20.0  medium   0.15
//* subtitle1    16.0  regular  0.15
//* subtitle2    14.0  medium   0.1
//* body1        16.0  regular  0.5   (bodyText1)
//* body2        14.0  regular  0.25  (bodyText2)
//* button       14.0  medium   1.25
//* caption      12.0  regular  0.4
//* overline     10.0  regular  1.5
TextTheme lightTextTheme() {
  return const TextTheme(
    headline1: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    ),
    headline2: TextStyle(
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    headline3: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    headline5: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    ),
    headline6: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    caption: TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      fontSize: 8,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.grey.withOpacity(0.1),
    ),
    borderRadius: BorderRadius.circular(5),
  );
  return InputDecorationTheme(
    border: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    focusedErrorBorder: outlineInputBorder,
  );
}
