class Address {
  String id;
  String street;
  String city;
  String state;
  String zipCode;
  String country;

  Address({
    required this.id,
    required this.state,
    required this.street,
    required this.city,
    required this.country,
    required this.zipCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as String,
      state: json['state'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      zipCode: json['zipCode'] as String,
    );
  }

  // Address.fromJson(String jsonString) {
  //   final _map = jsonDecode(jsonString);
  //   this.id = _map['id'];
  //   this.city = _map['city'];
  //   this.country = _map['country'];
  //   this.state = _map['state'];
  //   this.street = _map['street'];
  //   this.zipCode = _map['zipCode'];
  // }
}
