import 'dart:convert';
import 'dart:developer';

import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/settings/data/api_endpoints.dart';
import 'package:http/http.dart' as http;

class PlacesService {
  Future getPlaces() async {
    final response = await http.get(Uri.parse(ApiEndpoints.places));
    if (response.statusCode == 200) {
      final place = jsonDecode(response.body);

      final placeMap = Place.fromListJson(place);
      return placeMap;
    } else {
      log(response.body);
    }
  }
}
