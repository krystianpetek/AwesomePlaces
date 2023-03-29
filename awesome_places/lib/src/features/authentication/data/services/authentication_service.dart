import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_places/src/features/authentication/data/models/models.dart';
import 'package:awesome_places/src/features/authentication/data/models/to_json_models.dart';
import 'package:awesome_places/src/features/settings/data/api_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

abstract class IAuthenticationService {
  Future<String?> login({required LoginModel login});
  Future<void> register({required RegisterModel register});
}

class AuthenticationService implements IAuthenticationService {
  AuthenticationHttpHandler authenticationHttpHandler =
      const AuthenticationHttpHandler();

  @override
  Future<String?> login({required LoginModel login}) async {
    try {
      http.Response? response = await authenticationHttpHandler.post(
          url: ApiEndpoints.loginUrl, model: login);

      if (response!.statusCode != 200) {
        throw HttpException('${response.statusCode}');
      }

      final jsonMap = jsonDecode(response.body);
      final token = jsonMap['access_token'] as String;
      return token;
    } catch (exception) {
      log("$exception");
      rethrow;
    }
  }

  @override
  Future<void> register({required RegisterModel register}) async {
    try {
      http.Response? response = await authenticationHttpHandler.post(
          url: ApiEndpoints.registerUrl, model: register);

      if (response!.statusCode != 200) {
        throw HttpException('${response.statusCode}');
      }
    } catch (exception) {
      log("$exception");
      rethrow;
    }
  }
}

final authenticationServiceProvider = Provider<IAuthenticationService>((ref) {
  return AuthenticationService();
});

class AuthenticationHttpHandler {
  const AuthenticationHttpHandler();
  static const Map<String, String> headers = {
    "content-type": "application/json"
  };
  Future<http.Response?> post<T>(
      {required String url, required ToJsonModels model}) async {
    try {
      Uri postUrl = Uri.parse(url);
      String json = model.toJson();

      http.Response? response = await http.post(
        postUrl,
        headers: headers,
        body: json,
      );
      return response;
    } catch (exception) {
      log("$exception");
      rethrow;
    }
  }
}
