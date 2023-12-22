import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawonkoe/app/data/providers/ProductProvider.dart';
import 'package:pawonkoe/app/modules/createProduct/controllers/image_helper.dart';

class CreateProductController extends GetxController {
  //TODO: Implement CreateProductController
  ProductProvider productProvider = ProductProvider();
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

    // List<String> testVarian = ['v1', 'v2'];
    Map<String, dynamic> data = {
      'nama_product': namaProduct.text,
      'harga': harga.text,
      'deskripsi': deskripsi.text,
      'link_shopee': linkShopee.text,
      'stok': stok.text,
      'spesifikasi_product': beratJenis
          .text, // Assuming 'beratJenis' is meant for 'spesifikasi_product'
      'varian': varianControllers.map((controller) => controller.text).toList(),
    };
    print(data);
    try {
      print('fetch to api');
      final response = await productProvider.postProduct(imagePath, data);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
      }
      print('after fecth to api');
    } catch (e) {
      print(e.toString());
    }
  }
}
