import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConstData {
  static bool isLogin = false;
  static String token = '';
  static const String mapKey = '';
  static String? FCM = '';
  static String fcmToken = "";
  static String accessToken = "";
  static Future<void> updateToken() async {
    const String clientId = '';
    const String clientSecret = '';

    final response = await http.post(Uri.parse('http://localhost'), headers: {
      'Content-Type': 'application/json'
    }, body: {
      'grant_type': 'client_credentials',
      'client_id': clientId,
      'client_secret': clientSecret,
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      token = data['access_token'];
      isLogin = true;
      print('Token updated:$token');
    } else {
      print('failed to obtain access ${response.statusCode}');
      print('response body:${response.body} ');
    }
  }

  static Future<void> startTokenUpdate() async {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      updateToken();
    });
  }
}
