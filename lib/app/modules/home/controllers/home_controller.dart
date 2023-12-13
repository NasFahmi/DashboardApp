import 'package:get/get.dart';
import 'package:pawonkoe/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:pawonkoe/app/modules/NotesPreOrder/views/notes_pre_order_view.dart';
import 'package:pawonkoe/app/modules/Produk/views/produk_view.dart';
import 'package:pawonkoe/app/modules/Transaksi/controllers/transaksi_controller.dart';
import 'package:pawonkoe/app/modules/Transaksi/views/transaksi_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var selectedIndex = 0.obs;

  var Pages = [
    DashboardView(),
    ProdukView(),
    TransaksiView(),
    NotesPreOrderView()
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
