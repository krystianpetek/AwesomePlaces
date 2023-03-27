import 'dart:convert';
import 'dart:io';

import 'package:awesome_places/src/features/authentication/data/models/login.dart';
import 'package:awesome_places/src/features/settings/data/api_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

abstract class IAuthenticationService {
  Future<String?> login({required Login login});
}

class AuthenticationService implements IAuthenticationService {
  @override
  Future<String?> login({required Login login}) async {
    try {
      Uri preparedUrl = Uri.parse(ApiEndpoints.loginUrl);
      String json = login.toJson();

      http.Response response = await http.post(preparedUrl,
          body: json, headers: {"content-type": "application/json"});

      if (response.statusCode != 200) {
        throw HttpException('${response.statusCode}');
      }

      final jsonMap = jsonDecode(response.body);
      final token = jsonMap['access_token'] as String;
      return token;
    } on SocketException {
      print('No Internet connection 😑');
    } on HttpException {
      print("Couldn't find the post 😱");
    } on FormatException {
      print("Bad response format 👎");
    }
    return null;
  }
}

final authenticationServiceProvider = Provider<IAuthenticationService>((ref) {
  return AuthenticationService();
});
