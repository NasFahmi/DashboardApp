import 'package:get/get.dart';

import 'package:Pawonkoe/app/data/models/api.dart';
import 'package:Pawonkoe/app/data/providers/TokenHelper.dart';

class DashboardProvider extends GetConnect {
  Future<Response> getDashboardData() => get(
        '${AppApi.BASEURL + AppApi.dashboard}',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${TokenHelper.token}',
        },
      );
}
