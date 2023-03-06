import 'package:app_ui/presentation/pages/route_animation/slide_right.dart';
import 'package:app_ui/presentation/pages/route_animation/page_three.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(150, 50),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            child: const Text('go to page three'),
            onPressed: () {
              Navigator.of(context).push(SlideRight(page: PageThree()));
            },
          ),
        ),
      ),
    );
  }
}
