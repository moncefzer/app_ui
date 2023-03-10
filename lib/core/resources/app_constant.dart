// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class AppConstant {
  AppConstant._();
  static const double defaultPadding = 10;
  static const String usersCollection = 'users';
  static const String postsCollection = 'posts';
  static const String commentsCollection = 'comments';
  static const String replyCollection = 'replies';
  static const String profileImages = 'profileImages';
  static const String postsImages = 'postsImages';
}

navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
}

navigateAndFinish(BuildContext context, Widget widget) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => widget),
    (route) => false,
  );
}

navigateBack(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}

Future showToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

Color chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.WARNING:
      return Colors.amber;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.SUCCESS:
      return Colors.green;
  }
}

enum ToastStates {
  SUCCESS(Colors.green),
  ERROR(Colors.red),
  WARNING(Colors.amber);

  final Color color;
  const ToastStates(this.color);
}

void testPrint(var x) {
  debugPrint('*' * 30);
  debugPrint(x);
  debugPrint('*' * 30);
}

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
      ),
    ),
  );

  showDialog(
    context: context,
    barrierColor: AppColors.grey.withOpacity(0.8),
    barrierDismissible: false,
    builder: (context) => alertDialog,
  );
}
