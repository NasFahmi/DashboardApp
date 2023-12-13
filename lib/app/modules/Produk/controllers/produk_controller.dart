import 'package:get/get.dart';

class ProdukController extends GetxController {
  //TODO: Implement ProdukController

  final count = 0.obs;
  @override
  void onInit() {
    print('onInit product');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady product');
    super.onReady();
    getdata();
  }

  @override
  void onClose() {
    print('onClose product');
    super.onClose();
  }

  void increment() => count.value++;
  Future<void> getdata() async {
    await Future.delayed(Duration(seconds: 1)); // contoh penundaan 1 detik
    print('fetching');
  }
}
