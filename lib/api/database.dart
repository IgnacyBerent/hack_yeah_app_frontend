import 'package:hack_yeah_app_frontend/api/debug_logs.dart';
import 'package:hack_yeah_app_frontend/api/jwt.dart';
import 'package:http/http.dart' as http;

class DatabaseApi {
  final String url = "https://cognitivegamesbackend.onrender.com";
  final JwtToken jwt = JwtToken();
}
