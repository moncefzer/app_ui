import 'package:flutter/material.dart';
import '../resources/app_colors.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.text, required this.press});

  final String text;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
        ),
        child: Text(text),
      ),
    );
  }
}
