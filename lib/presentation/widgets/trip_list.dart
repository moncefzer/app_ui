import 'package:app_ui/data/models/Trip.dart';
import 'package:app_ui/presentation/widgets/page_slider.dart';
import 'package:flutter/material.dart';

import '../pages/details.dart';

class TripList extends StatelessWidget {
  final GlobalKey _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return ListItem(trip: trips[index]);
        });
  }
}

class ListItem extends StatelessWidget {
  final Trip trip;
  const ListItem({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(PageSlider(page: Details(trip: trip)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${trip.nights} nights',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.blue[300],
            ),
          ),
          Text(
            trip.title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          trip.img,
          height: 50.0,
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }
}
