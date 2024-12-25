import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrl => dotenv.env['baseUrl'] ?? '';
  static String get baseUrl_providor => dotenv.env['baseUrl_providor'] ?? '';
  static String get apiKey => dotenv.env['api_key'] ?? '';

  static Future<void> loadEnv() async {
    await dotenv.load(fileName:'.env.dev');
  }
}