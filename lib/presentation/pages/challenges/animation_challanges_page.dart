import 'package:app_ui/presentation/pages/animted_widgets/learn_tween_page.dart';
import 'package:app_ui/presentation/pages/challenges/gmail_notifications_page.dart';
import 'package:app_ui/presentation/pages/challenges/shrink_top_list_page.dart';
import 'package:app_ui/presentation/pages/route_animation/animate_route.dart';
import 'package:flutter/material.dart';

class ChallangePage {
  final Widget page;
  final String info;

  ChallangePage(this.page, this.info);
}

class AnimationChallPage extends StatelessWidget {
  AnimationChallPage({super.key});

  final List<ChallangePage> challanges = [
    ChallangePage(LearnTweenPage(), 'Learn Tween animation'),
    ChallangePage(ShrinkTopListPage(), 'Shrink Top List Page'),
    ChallangePage(GmailNotificationsPage(), 'Gmail notification Page'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animation Challenges',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: challanges
              .map(
                (challange) => Card(
                  child: ListTile(
                    leading: Text(challange.info),
                    onTap: () {
                      Navigator.of(context).push(
                        SlideRight(page: challange.page),
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
