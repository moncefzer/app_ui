import 'package:app_ui/presentation/pages/route_animation/page_one.dart';
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
      home: const PageOne(),
    );
  }
}
