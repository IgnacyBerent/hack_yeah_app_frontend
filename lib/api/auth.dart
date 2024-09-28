import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:hack_yeah_app_frontend/api/debug_logs.dart';
import 'package:hack_yeah_app_frontend/api/jwt.dart';

class Authenticate {
  final String baseUrl = '';
  final JwtToken jwt = JwtToken();

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.saveTokens(responseBody);
    } else {
      if (response.statusCode == 401) {
        throw Exception('Invalid credentials');
      } else if (response.statusCode == 400) {
        throw Exception('Bad request');
      } else {
        throw Exception('Failed to login');
      }
    }
  }

  Future<void> register(
      String firstName, String lastName, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      await login(email, password);
    } else {
      if (response.statusCode == 400) {
        debugLogs(response.statusCode, 201);
        throw Exception('Bad request');
      } else {
        debugLogs(response.statusCode, 201);
        throw Exception('Failed to register');
      }
    }
  }

  Future<void> logout() async {
    await jwt.deleteToken();
  }

  Future<bool> refreshToken() async {
    String? rt = await jwt.getRefreshToken();

    final response = await http.post(
      Uri.parse('$baseUrl/refresh_token?refresh_token=$rt'),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.updateToken(responseBody['access_token']);
      return true;
    } else {
      return false;
    }
  }
}
