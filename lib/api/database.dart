import 'dart:convert';
import 'dart:developer';

import 'package:hack_yeah_app_frontend/api/auth.dart';
import 'package:hack_yeah_app_frontend/api/debug_logs.dart';
import 'package:hack_yeah_app_frontend/models/benefit.dart';
import 'package:hack_yeah_app_frontend/models/project.dart';
import 'package:hack_yeah_app_frontend/models/wallet.dart';
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
    final response = await http.get(Uri.parse('$urlDamian/get_projects'));
    if (response.statusCode == 200) {
      final List<dynamic> responseBody =
          json.decode(utf8.decode(response.bodyBytes));
      log(responseBody.toString());
      List<Project> projects =
          responseBody.map((e) => Project.fromJson(e)).toList();
      for (var project in projects) {
        project.votes = await votesCount(project.id);
      }
      return projects;
    } else {
      debugLogs(response.statusCode, 202);
      throw Exception('Failed to load projects');
    }
  }

  Future<int> votesCount(String projectId) async {
    final response = await http.get(Uri.parse('$urlDamian/vote/$projectId'));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody['upvotes'] + responseBody['downvotes'];
    } else {
      debugLogs(response.statusCode, 202);
      throw Exception('Failed to load votes');
    }
  }

  Future<Wallet> getUserWallet() async {
    Authenticate auth = Authenticate();
    final user = await auth.getMe();
    final uId = user.id;
    final response = await http.get(Uri.parse('$urlMichal/user/$uId'));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return Wallet.fromJson(responseBody);
    } else {
      debugLogs(response.statusCode, 202);
      throw Exception('Failed to load wallet');
    }
  }

  Future<void> addFunds(int amount) async {
    Authenticate auth = Authenticate();
    final user = await auth.getMe();
    final uId = user.id;
    final response = await http.post(
      Uri.parse('$urlDamian/wallet/$uId/add_money/$amount'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode != 200) {
      debugLogs(response.statusCode, 202);
      throw Exception('Failed to add funds');
    }
  }
}
