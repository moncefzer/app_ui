import 'package:flutter/material.dart';
import '../helper/extensions/context_extensions.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: context.headline3,
      ),
    );
  }
}
