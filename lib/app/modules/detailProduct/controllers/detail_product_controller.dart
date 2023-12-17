import 'package:get/get.dart';

class DetailProductController extends GetxController {
  //TODO: Implement DetailProductController
  // late int getDetailProduct;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('detail product on init');
    // getDetailProduct = Get.arguments();
  }

  @override
  void onReady() {
    super.onReady();
    print('detail product on ready');
    // print(getDetailProduct);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
