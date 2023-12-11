import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../models/api.dart';

class AuthProvider extends GetConnect {
  // Get Token
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Response> authLogin(Map data) =>
      post('${AppApi.BASEURL + AppApi.loginUrl}', data);

  // Future<Response> authLogin(Map data) =>
  //     post('http://127.0.0.1:8000/api/login', data);

  Future<Response> authLogout(String token) => get(
        '${AppApi.BASEURL + AppApi.logoutUrl}',
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json', // Add a comma here
          'Authorization': 'Bearer ${token}',
        },
      );
}
