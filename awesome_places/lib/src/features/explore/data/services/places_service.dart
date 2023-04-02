import 'dart:convert';
import 'dart:developer';

import 'package:awesome_places/src/features/authentication/data/providers/authentication_provider.dart';
import 'package:awesome_places/src/features/explore/data/models/place.dart';
import 'package:awesome_places/src/features/settings/data/api_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class PlacesService {
  PlacesService({required this.ref});
  final WidgetRef ref;
  PlacesHttpHandler placesHttpHandler = PlacesHttpHandler();

  Future<List<Place>?> getPlaces() async {
    String authToken = ref.read(authenticationProvider).accessToken;
    try {
      http.Response response = await placesHttpHandler.getCollection(
          access_token: authToken, url: ApiEndpoints.getPlaceCollection);

      if (response.statusCode == 200) {
        final place = jsonDecode(response.body);

        final placeMap = Place.fromListJson(place);
        return placeMap ?? <Place>[];
      }
    } catch (exception) {
      log("$exception");
      rethrow;
    }
    return null;
  }
}

class PlacesHttpHandler {
  Map<String, String> headers = {
    "content-type": "application/json",
  };
  Future<http.Response> getCollection<T>(
      {required String access_token, required String url}) async {
    try {
      headers.addAll({"Authorization": "Bearer $access_token"});

      Uri getUrl = Uri.parse(url);
      http.Response? response = await http.get(
        getUrl,
        headers: headers,
      );
      return response;
    } catch (exception) {
      log("$exception");
      rethrow;
    }
  }
}
