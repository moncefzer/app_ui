import 'package:app_ui/presentation/pages/animted_widgets/tween_animation_1.dart';
import 'package:app_ui/presentation/pages/animted_widgets/tween_animation_2.dart';
import 'package:app_ui/presentation/pages/animted_widgets/tween_animation_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class LearnTweenPage extends StatelessWidget {
  LearnTweenPage({super.key});

  final List<Widget> pages = [
    TweenAnimation1(),
    TweenAnimation2(),
    TweenAnimation3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SafeArea(
          child: Column(
            children: [
              ...pages.map(
                (page) {
                  return Card(
                    child: ListTile(
                      title: Text('Item ${lorem(paragraphs: 1, words: 1)}'),
                      subtitle: Text(lorem(paragraphs: 1, words: 5)),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => page,
                          ),
                        );
                      },
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
