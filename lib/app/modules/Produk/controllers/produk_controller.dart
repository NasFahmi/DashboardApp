import 'package:get/get.dart';
import 'package:pawonkoe/app/data/models/ProductModel.dart';
import 'package:pawonkoe/app/data/providers/ProductProvider.dart';

class ProdukController extends GetxController {
  ProductProvider productProvider = ProductProvider();
  Rx<ListProduct> productInformation = ListProduct().obs;

  final count = 0.obs;
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

  void increment() => count.value++;
  Future<void> getdataListProduct() async {
    print('get data List Product');
    try {
      print('fecth api list product');
      final response = await productProvider.getListProduct();
      print('after fecth api');
      if (response.statusCode == 200) {
        print('success fecth api');
        print(response.body);
        Map<String, dynamic> responseData = response.body;
        print(responseData);
        productInformation.value = ListProduct.fromJson(responseData);
        print(productInformation.value.data?[0].harga);
      } else {
        print(response.statusCode);
      }
    } catch (e) {}
  }
}
