import 'package:app_ui/core/resources/app_resources.dart';
import 'package:flutter/material.dart';

import '../widgets/screen_title.dart';
import '../widgets/trip_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageResources.bg),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const SizedBox(
              height: 160,
              child: ScreenTitle(text: 'Farhat Trips'),
            ),
            Flexible(
              child: TripList(),
            )
            //Sandbox(),
          ],
        ),
      ),
    );
  }
}
