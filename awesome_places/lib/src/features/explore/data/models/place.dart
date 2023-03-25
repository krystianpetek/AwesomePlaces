import 'dart:typed_data';

import 'address.dart';
import 'coordinate.dart';

class Place {
  String id;
  String description;
  int placeType;
  Uint8List image;
  double rating;
  bool requiredFee;
  Coordinate coordinate;
  Address? address;

  Place({
    required this.id,
    required this.description,
    required this.placeType,
    required this.image,
    required this.rating,
    required this.requiredFee,
    required this.coordinate,
    required this.address,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] as String,
      description: json['description'] as String,
      placeType: json['placeType'] as int,
      image: json['image'] as Uint8List,
      rating: json['rating'] as double,
      requiredFee: json['requiredFee'] as bool,
      address: json['address'] as Address,
      coordinate: json['coordinate'] as Coordinate,
    );
  }
}
