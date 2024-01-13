import 'package:get/get.dart';
import 'package:Pawonkoe/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:Pawonkoe/app/modules/Produk/controllers/produk_controller.dart';
import 'package:Pawonkoe/app/modules/Transaksi/controllers/transaksi_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<TransaksiController>(
    //   () => TransaksiController(),
    // );

    // Get.lazyPut<ProdukController>(
    //   () => ProdukController(),
    // );
    Get.put<ProdukController>(ProdukController());
    Get.put<TransaksiController>(TransaksiController());

    // Get.lazyPut<DashboardController>(
    //   () => DashboardController(),
    // );
    Get.put<DashboardController>(DashboardController());
  }
}
