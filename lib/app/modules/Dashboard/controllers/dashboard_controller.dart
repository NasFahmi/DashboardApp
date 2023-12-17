import 'dart:async';

import 'package:get/get.dart';
import 'package:pawonkoe/app/data/models/DashboardModel.dart';
import 'package:pawonkoe/app/data/providers/DashboardProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  DashboardProvider dashboardProvider = DashboardProvider();
  Rx<Dashboard> dashboardData = Dashboard().obs;

  // DateTime dateTime = DateTime.now();
  Rx<DateTime> dateTime = DateTime.now().obs;

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  @override
  void onInit() {
    print('oninit dashboard');
    Timer.periodic(Duration(seconds: 1), (timer) {
      dateTime.value = DateTime.now();
      // print(dateTime);
      update(); // Notify the UI about the change
    });
    super.onInit();
  }

  @override
  void onReady() async {
    print('ready dashboard');
    print(getToken());
    getDataDashboard();

    // print(DateFormat('HH.mm dd MMMM yyyy').format(dateTime));

    super.onReady();
  }

  @override
  void onClose() {
    print('on close in dashboard');
    super.onClose();
  }

  Future<void> getDataDashboard() async {
    print('getData Dashboard');
    try {
      print('fecth Data Dashboard');
      final response = await dashboardProvider.getDashboardData();
      print(response.statusText);
      print('success fecth Data Dashboard');
      if (response.statusCode == 200) {
        print('response 200 ok data Dashboard');
        print(response.body);
        Map<String, dynamic> responseData = response.body;
        print(responseData);
        dashboardData.value = Dashboard.fromJson(responseData); //success
        print(
            'sample foto ${dashboardData.value.data?.product?[0].fotos?[0].url}');
        print(dashboardData.value.data?.product?[1].fotos?.first.url);
        print(dashboardData.value.data?.product?.length);
      } else {
        print('errors ${response.statusCode}');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
