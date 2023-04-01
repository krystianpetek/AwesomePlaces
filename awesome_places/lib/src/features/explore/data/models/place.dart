import 'dart:convert';
import 'dart:typed_data';

import 'address.dart';
import 'coordinate.dart';

class Place {
  String id;
  String name;
  String description;
  int placeType;
  Uint8List image;
  double rating;
  bool requiredFee;
  Coordinate? coordinate;
  Address? address;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.placeType,
    required this.image,
    required this.rating,
    required this.requiredFee,
    required this.address,
    required this.coordinate,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        placeType: json['placeType'] as int,
        image: base64.decode(json['image']),
        rating: json['rating'] as double,
        requiredFee: json['requiredFee'] as bool,
        address: Address.fromJson(json['address']),
        coordinate: Coordinate.fromJson(json['coordinate']));
  }

  static List<Place>? fromListJson(List<dynamic> json) {
    List<Place> places = <Place>[];

    for (var element in json) {
      Place place = Place.fromJson(element);
      places.add(place);
    }
    return places;
  }
}
