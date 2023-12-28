import 'package:get/get.dart';

import 'package:pawonkoe/app/data/models/api.dart';
import 'package:pawonkoe/app/data/providers/TokenHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardProvider extends GetConnect {
  Future<Response> getDashboardData() => get(
        '${AppApi.BASEURL + AppApi.dashboard}',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${TokenHelper.token}',
        },
      );
}
