import 'package:get/get.dart';
import 'package:pawonkoe/app/data/models/ProductModel.dart';
import 'package:pawonkoe/app/data/providers/ProductProvider.dart';

class ProdukController extends GetxController {
  ProductProvider productProvider = ProductProvider();
  Rx<ProductList> productList = ProductList().obs;
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

  Future<void> getdata() async {
    try {
      print('fecth Data product');
      final response = await productProvider.getListProduct();
      print('success fecth Data product');
      if (response.statusCode == 200) {
        print('response 200 ok data product');
        print(response.body);
        Map<String, dynamic> responseData = response.body;
        print(responseData);
        productList.value = ProductList.fromJson(responseData);
        // print('test product information = ${productList.value.data?.length}');
        print(
            'test product image information = ${productList.value.data?[0].fotos?[0].url}');
        update();
      }
    } catch (e) {
      Future.error(e);
    }
  }
}
