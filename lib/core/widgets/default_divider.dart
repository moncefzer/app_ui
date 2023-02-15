import 'package:flutter/material.dart';

import '../resources/app_colors.dart';

class DefaultDivider extends StatelessWidget {
  const DefaultDivider(
      {super.key,
      this.color = AppColors.grey,
      this.thickness = 1,
      this.height = 0});
  final Color color;
  final double thickness;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      height: height,
    );
  }
}
