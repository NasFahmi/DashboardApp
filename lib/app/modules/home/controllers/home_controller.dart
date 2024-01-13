import 'package:get/get.dart';
import 'package:Pawonkoe/app/data/providers/TokenHelper.dart';
import 'package:Pawonkoe/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:Pawonkoe/app/modules/Produk/views/produk_view.dart';
import 'package:Pawonkoe/app/modules/Transaksi/controllers/transaksi_controller.dart';
import 'package:Pawonkoe/app/modules/Transaksi/views/transaksi_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectedIndex = 0.obs;

  var Pages = [
    DashboardView(),
    ProdukView(),
    TransaksiView(),
  ];
  @override
  void onInit() {
    print('on init in home');

    super.onInit();
  }

  @override
  void onReady() {
    print('on ready in home');
    super.onReady();
  }

  @override
  void onClose() {
    print('on close in home');
    super.onClose();
  }
}
