import 'package:flutter/material.dart';

import '../../data/models/Trip.dart';
import '../pages/details.dart';
import 'page_slider.dart';

class ListItem extends StatelessWidget {
  final Trip trip;
  const ListItem({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        // Navigator.of(context).push(PageSlider(page: Details(trip: trip)));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        child: Hero(
          tag: trip.img,
          child: Image.asset(
            trip.img,
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }
}
