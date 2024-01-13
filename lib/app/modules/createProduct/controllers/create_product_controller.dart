import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Pawonkoe/app/components/_SnackBarLoginError.dart';
import 'package:Pawonkoe/app/data/providers/ProductProvider.dart';
import 'package:Pawonkoe/app/modules/createProduct/controllers/image_helper.dart';
import 'package:Pawonkoe/app/routes/app_pages.dart';

class CreateProductController extends GetxController {
  ProductProvider productProvider = ProductProvider();
  final TextEditingController namaProduct = TextEditingController();
  final TextEditingController harga = TextEditingController();
  final TextEditingController spesifikasi = TextEditingController();
  final TextEditingController deskripsi = TextEditingController();
  final TextEditingController linkShopee = TextEditingController();
  final TextEditingController stok = TextEditingController();
  List<TextEditingController> varianControllers = [TextEditingController()].obs;
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  ImageHelper imageHelper = ImageHelper();
  RxList images = [].obs;
  var singleImage;
  List<String> imagePath = [];

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

  void addPathImage() {
    for (File file in images) {
      imagePath.add(file.path);
    }
    print(imagePath);
  }

  Future<void> uploadProduct() async {
    addPathImage();

    Map<String, dynamic> data = {
      'nama_product': namaProduct.text,
      'harga': harga.text,
      'deskripsi': deskripsi.text,
      'link_shopee': linkShopee.text,
      'stok': stok.text,
      'spesifikasi_product': spesifikasi.text,
    };
    List<String> varianValues =
        varianControllers.map((controller) => controller.text).toList();

    print(data);

    try {
      print('fetch to api');
      final response = await productProvider
          .postProduct(imagePath, varianValues, data)
          .timeout(
        Duration(seconds: 15),
        onTimeout: () {
          throw TimeoutException('error timeout exception');
        },
      ); //upload

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        clearControllersAndImages(); // Membersihkan controller dan daftar gambar
        Get.offAllNamed(Routes.HOME); //pindah page

        Get.showSnackbar(snackBarSuccesfullyCreateProduct());
      } else {
        Get.back();
        Get.showSnackbar(snackBarTimeOut());
        print(response.statusCode);
        print(response.data);
      }
      print('after fetch to api');
    } catch (e) {
      print(e.toString());
    }
  }

  void clearControllersAndImages() {
    // Membersihkan semua controller
    namaProduct.clear();
    harga.clear();
    deskripsi.clear();
    linkShopee.clear();
    stok.clear();
    spesifikasi.clear();
    for (var controller in varianControllers) {
      controller.clear();
    }

    // Membersihkan daftar gambar
    images.clear();
    imagePath.clear();
  }
}
