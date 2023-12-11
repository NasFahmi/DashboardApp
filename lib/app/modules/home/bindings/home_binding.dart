import 'package:get/get.dart';
import 'package:pawonkoe/app/modules/Dashboard/controllers/dashboard_controller.dart';
import 'package:pawonkoe/app/modules/NotesPreOrder/controllers/notes_pre_order_controller.dart';
import 'package:pawonkoe/app/modules/Produk/controllers/produk_controller.dart';
import 'package:pawonkoe/app/modules/Transaksi/controllers/transaksi_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<ProdukController>(ProdukController());
    Get.put<TransaksiController>(TransaksiController());
    Get.put<NotesPreOrderController>(NotesPreOrderController());
    Get.put<DashboardController>(DashboardController());
  }
}
