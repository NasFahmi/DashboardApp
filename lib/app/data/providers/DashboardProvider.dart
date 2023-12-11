import 'package:get/get.dart';

import 'package:pawonkoe/app/data/models/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProvider extends GetConnect {
  String? token;
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return token = prefs.getString('token');
  }

  Future<Response> getDashboardData() => get(
        '${AppApi.BASEURL + AppApi.dashboard}',
      );
}
