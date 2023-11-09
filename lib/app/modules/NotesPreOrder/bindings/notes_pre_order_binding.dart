import 'package:get/get.dart';

import '../controllers/notes_pre_order_controller.dart';

class NotesPreOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotesPreOrderController>(
      () => NotesPreOrderController(),
    );
  }
}
