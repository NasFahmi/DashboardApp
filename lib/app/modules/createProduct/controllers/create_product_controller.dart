import 'package:get/get.dart';

class CreateProductController extends GetxController {
  //TODO: Implement CreateProductController
  Map<String, bool> beratJenis = {
    'Kecil': false,
    'Sedang': false,
    'Berat': false,
    'Sangat Berat': false,
  }.obs;
  final count = 0.obs;
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

  void increment() => count.value++;
}
