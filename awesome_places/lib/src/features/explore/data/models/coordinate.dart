class Coordinate {
  String id;
  double latitude;
  double longitude;

  Coordinate(
      {required this.id, required this.longitude, required this.latitude});

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
        id: json['id'] as String,
        longitude: json['longitude'] as double,
        latitude: json['latitude'] as double);
  }
}
