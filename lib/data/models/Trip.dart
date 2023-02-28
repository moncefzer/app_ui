import 'package:app_ui/core/resources/app_resources.dart';

class Trip {
  final String title;
  final String price;
  final String nights;
  final String img;

  Trip(
      {required this.title,
      required this.price,
      required this.nights,
      required this.img});
}

final List<Trip> trips = [
  Trip(
      title: 'Beach Paradise',
      price: '350',
      nights: '3',
      img: ImageResources.beach),
  Trip(
      title: 'City Break', price: '400', nights: '5', img: ImageResources.city),
  Trip(
      title: 'Ski Adventure',
      price: '750',
      nights: '2',
      img: ImageResources.ski),
  Trip(
      title: 'Space Blast',
      price: '600',
      nights: '4',
      img: ImageResources.skip),
];
