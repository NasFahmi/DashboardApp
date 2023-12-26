import 'package:get/get.dart';
import 'package:pawonkoe/app/components/_SnackBarLoginError.dart';
import 'package:pawonkoe/app/data/models/DetailProductModel.dart';
import 'package:pawonkoe/app/data/providers/ProductProvider.dart';
import 'package:pawonkoe/app/modules/home/views/home_view.dart';
import 'package:pawonkoe/app/routes/app_pages.dart';

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
        print(productDetailInformation.value.data?.varians?.length);
        print(productDetailInformation.value.data?.varians?[0].jenisVarian);
      }
    } catch (e) {}
  }

  Future<void> deleteProductByid() async {
    try {
      final response = await productProvider.deleteProduct(productArgument);
      if (response.statusCode == 200) {
        print('status fecth 200 ok');
        print(response.body);
        Get.offAndToNamed(Routes.HOME);
        Get.showSnackbar(snackBarSuccesfullyDeleteProduct());
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
