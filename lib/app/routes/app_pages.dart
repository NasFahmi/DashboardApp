import 'package:get/get.dart';

import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/OnBoard/bindings/on_board_binding.dart';
import '../modules/OnBoard/views/on_board_view.dart';
import '../modules/Produk/bindings/produk_binding.dart';
import '../modules/Produk/views/produk_view.dart';
import '../modules/Transaksi/bindings/transaksi_binding.dart';
import '../modules/Transaksi/views/transaksi_view.dart';
import '../modules/createProduct/bindings/create_product_binding.dart';
import '../modules/createProduct/views/create_product_view.dart';
import '../modules/detailProduct/bindings/detail_product_binding.dart';
import '../modules/detailProduct/views/detail_product_view.dart';
import '../modules/editProduct/bindings/edit_product_binding.dart';
import '../modules/editProduct/views/edit_product_view.dart';
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
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => const OnBoardView(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUCT,
      page: () => const CreateProductView(),
      binding: CreateProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => const EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => const DetailProductView(),
      binding: DetailProductBinding(),
    ),
  ];
}
