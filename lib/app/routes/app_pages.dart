import 'package:get/get.dart';

import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/NotesPreOrder/bindings/notes_pre_order_binding.dart';
import '../modules/NotesPreOrder/views/notes_pre_order_view.dart';
import '../modules/Produk/bindings/produk_binding.dart';
import '../modules/Produk/views/produk_view.dart';
import '../modules/Transaksi/bindings/transaksi_binding.dart';
import '../modules/Transaksi/views/transaksi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK,
      page: () => const ProdukView(),
      binding: ProdukBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => const TransaksiView(),
      binding: TransaksiBinding(),
    ),
    GetPage(
      name: _Paths.NOTES_PRE_ORDER,
      page: () => const NotesPreOrderView(),
      binding: NotesPreOrderBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
