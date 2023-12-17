import 'package:get/get.dart';
import 'package:pawonkoe/app/data/models/DetailProductModel.dart';
import 'package:pawonkoe/app/data/providers/ProductProvider.dart';

class DetailProductController extends GetxController {
  //TODO: Implement DetailProductController
  late var productArgument; // Use 'late' instead of 'var'
  ProductProvider productProvider = ProductProvider();
  Rx<ProductDetail> productDetailInformation = ProductDetail().obs;

  @override
  void onInit() {
    super.onInit();
    print('detail product on init');
    productArgument = Get.arguments as int?; // Cast to int
  }

  @override
  void onReady() {
    super.onReady();
    print('detail product on ready');
    print(productArgument);
    getProductbyId();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getProductbyId() async {
    try {
      final response = await productProvider.getProductById(productArgument);
      if (response.statusCode == 200) {
        print('sucess fetch status code 200');
        print(response.body);
        Map<String, dynamic> responseData = response.body;
        productDetailInformation.value = ProductDetail.fromJson(responseData);
        print(productDetailInformation.value.data?.fotos?.first.url);
      }
    } catch (e) {}
  }
}
