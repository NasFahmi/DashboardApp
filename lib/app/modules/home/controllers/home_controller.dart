import 'package:get/get.dart';
import 'package:pawonkoe/app/modules/Dashboard/views/dashboard_view.dart';
import 'package:pawonkoe/app/modules/NotesPreOrder/views/notes_pre_order_view.dart';
import 'package:pawonkoe/app/modules/Produk/views/produk_view.dart';
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
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
