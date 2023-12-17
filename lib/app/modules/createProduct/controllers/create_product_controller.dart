import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/modules/createProduct/controllers/image_helper.dart';

class CreateProductController extends GetxController {
  //TODO: Implement CreateProductController
  final TextEditingController namaProduct = TextEditingController();
  final TextEditingController harga = TextEditingController();
  final TextEditingController beratJenis = TextEditingController();
  final TextEditingController deskripsi = TextEditingController();
  final TextEditingController linkShopee = TextEditingController();
  final TextEditingController stok = TextEditingController();
  List<TextEditingController> varianControllers = [TextEditingController()].obs;
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  ImageHelper imageHelper = ImageHelper();
  RxList images = [].obs;
  var singleImage;

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
