import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper {
  static String? token;

  static addToken(String tokenFromAuth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', tokenFromAuth);
    String? tokenData = await getToken();
    token = tokenData;
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    token = null;
  }
}
