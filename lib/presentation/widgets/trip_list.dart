import 'package:app_ui/data/models/Trip.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class TripList extends StatefulWidget {
  TripList({super.key});

  @override
  State<TripList> createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  Tween<Offset> _offset = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero);

  @override
  void initState() {
    //* function get trigered only after build function complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _addTrips();
      _listKey.currentState!.insertItem(2);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Do staggered animated LIst
    // return AnimatedList(
    //   key: _listKey,
    //   initialItemCount: trips.length,
    //   itemBuilder: (context, index, animation) {
    //     return SlideTransition(
    //       position: animation.drive(_offset),
    //       child: ListItem(
    //         trip: trips[index],
    //       ),
    //     );
    //   },
    // );
    return ListView.builder(
      itemCount: trips.length,
      itemBuilder: (context, index) {
        return ListItem(trip: trips[index]);
      },
    );
  }
}
