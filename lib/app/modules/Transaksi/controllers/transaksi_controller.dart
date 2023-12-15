import 'package:get/get.dart';

class TransaksiController extends GetxController {
  //TODO: Implement TransaksiController

  final count = 0.obs;
  List<int> dataSixBar = [
    500000,
    800000,
    300000,
    400000,
    350000,
    750000,
  ].obs;
  @override
  void onInit() {
    print('onInit transaksi');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady transaksi');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose Transaksi');
    super.onClose();
  }

  void increment() => count.value++;
}
