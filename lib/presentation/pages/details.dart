import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart' as lipsum;

import '../../data/models/Trip.dart';
import '../widgets/heart.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.trip});
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                child: Image.asset(
              trip.img,
              height: 360,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )),
            const SizedBox(height: 30),
            ListTile(
              title: Text(trip.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[800])),
              subtitle: Text(
                  '${trip.nights} night stay for only \$${trip.price}',
                  style: const TextStyle(letterSpacing: 1)),
              trailing: Heart(),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                lipsum.lorem(paragraphs: 1, words: 20),
                style: TextStyle(color: Colors.grey[600], height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
