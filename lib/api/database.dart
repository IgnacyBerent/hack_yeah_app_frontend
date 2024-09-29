import 'dart:convert';
import 'dart:developer';

import 'package:hack_yeah_app_frontend/api/debug_logs.dart';
import 'package:hack_yeah_app_frontend/models/benefit.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:http/http.dart' as http;

class DatabaseApi {
  final String urlMichal = "https://hackyeah-c628.onrender.com";
  final String urlDamian = "https://backendhackyeah.onrender.com";

  Future<List<Benefit>> getBenefits() async {
    log('Running getBenefits $urlMichal/benefits');
    final response = await http.get(Uri.parse('$urlMichal/benefits'));
    log(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      log(responseBody.toString());
      return responseBody.map((e) => Benefit.fromJson(e)).toList();
    } else {
      debugLogs(response.statusCode, 202);
      throw Exception('Failed to load benefits');
    }
  }

  Future<List<Project>> getProjects() async {
    throw UnimplementedError();
  }
}
