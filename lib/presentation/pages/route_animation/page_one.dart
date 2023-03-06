import 'package:app_ui/presentation/pages/route_animation/slide_right.dart';
import 'package:app_ui/presentation/pages/route_animation/page_two.dart';
import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text('go to page two'),
            onPressed: () {
              Navigator.of(context).push(SlideRight(page: PageTwo()));
            },
          ),
        ),
      ),
    );
  }
}
