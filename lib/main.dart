import 'package:app_ui/presentation/pages/animted_widgets/explicit_anim_page.dart';
import 'package:app_ui/presentation/pages/animted_widgets/learn_tween_page.dart';
import 'package:app_ui/presentation/pages/scroll/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:app_ui/core/resources/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: AppThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      home: LearnTweenPage(),
    );
  }
}
