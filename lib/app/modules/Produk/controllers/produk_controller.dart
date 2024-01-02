import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/data/models/ProductModel.dart';
import 'package:pawonkoe/app/data/providers/ProductProvider.dart';

class ProdukController extends GetxController {
  ProductProvider productProvider = ProductProvider();
  TextEditingController inputsearch = TextEditingController();
  Rx<ListProduct> productInformation = ListProduct().obs;
  RxList mainProductList = [].obs;
  RxList productDisplayList = [].obs;

  @override
  void onInit() {
    print('onInit product');
    super.onInit();
    getdataListProduct();
  }

  @override
  void onReady() {
    print('onReady product');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose product');
    super.onClose();
  }

  Future<void> getdataListProduct() async {
    print('get data List Product');
    try {
      print('fetch api list product');
      final response = await productProvider.getListProduct();
      print('after fetch api');
      if (response.statusCode == 200) {
        print('success fetch api');
        print(response.body);
        Map<String, dynamic> responseData = response.body;
        print(responseData);
        productInformation.value = ListProduct.fromJson(responseData);
        mainProductList.addAll(productInformation.value.data!);
        print('in main product list = ${mainProductList.length}');
        productDisplayList = RxList.from(mainProductList);
        print(productInformation.value.data?[0].namaProduct);
        print('total product search = ${productDisplayList.length}');
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void updateList(String value) {
    productDisplayList.assignAll(mainProductList
        .where((element) =>
            element.namaProduct!.toLowerCase().contains(value.toLowerCase()))
        .toList());
  }
}
