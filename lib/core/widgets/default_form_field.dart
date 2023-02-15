import 'package:flutter/material.dart';
import '../helper/extensions/context_extensions.dart';
import '../resources/app_colors.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.isPass = false,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final bool isPass;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.black,
      controller: controller,
      obscureText: isPass,
      style: context.headline4,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIconConstraints: const BoxConstraints(maxWidth: 60, minWidth: 40),
        prefixIcon: prefixIcon,
        hintStyle: context.headline4.copyWith(color: AppColors.mainText),
        filled: true,
        fillColor: AppColors.grey.withOpacity(0.35),
      ),
    );
  }
}
