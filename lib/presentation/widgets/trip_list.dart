import 'package:app_ui/data/models/Trip.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class TripList extends StatelessWidget {
  final GlobalKey _listKey = GlobalKey();

  TripList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: trips.length,
      itemBuilder: (context, index) {
        return ListItem(trip: trips[index]);
      },
    );
  }
}
