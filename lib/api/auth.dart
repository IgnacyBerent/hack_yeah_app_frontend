import 'dart:convert';
import 'dart:developer';

import 'package:hack_yeah_app_frontend/models/user.dart';
import 'package:http/http.dart' as http;

import 'package:hack_yeah_app_frontend/api/debug_logs.dart';
import 'package:hack_yeah_app_frontend/api/jwt.dart';

class Authenticate {
  final String baseUrl = 'https://cityboost-auth.onrender.com';
  final JwtToken jwt = JwtToken();

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
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

  Future<void> register({
    required String firstName,
    required String lastName,
    required String pesel,
    required String gmina,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'full_name': '$firstName $lastName',
        'pesel': pesel,
        'district': gmina,
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
      Uri.parse('$baseUrl/refresh'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'refresh_token': rt}),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      await jwt.updateToken(responseBody['access_token']);
      return true;
    } else {
      return false;
    }
  }

  Future<User> getMe() async {
    log('Getting user');
    String? at = await jwt.getToken();

    final response = await http.post(
      Uri.parse('$baseUrl/get_me'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${await jwt.getToken()}',
      },
      body: jsonEncode({'access_token': at}),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      log(responseBody.toString());
      return User.fromJson(responseBody);
    } else {
      throw Exception('Failed to get user');
    }
  }
}
