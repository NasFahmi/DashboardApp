import 'package:get/get.dart';

class NotesPreOrderController extends GetxController {
  //TODO: Implement NotesPreOrderController

  final count = 0.obs;
  @override
  void onInit() {
    print('onInit notesPO');
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady notesPO');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose notesPO');
    super.onClose();
  }

  void increment() => count.value++;
}
