import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/components/_SnackBarLoginError.dart';
import 'package:pawonkoe/app/data/models/DetailProductModel.dart';
import 'package:pawonkoe/app/data/providers/ProductProvider.dart';
import 'package:pawonkoe/app/modules/createProduct/controllers/image_helper.dart';
import 'package:pawonkoe/app/routes/app_pages.dart';

class EditProductController extends GetxController {
  //TODO: Implement EditProductController
  late Rx<ProductDetail>
      productDetailInformation; // Use 'late' instead of 'var'

  ProductProvider productProvider = ProductProvider();
  final TextEditingController namaProduct = TextEditingController();
  final TextEditingController harga = TextEditingController();
  final TextEditingController spesifikasi = TextEditingController();
  final TextEditingController deskripsi = TextEditingController();
  final TextEditingController linkShopee = TextEditingController();
  final TextEditingController stok = TextEditingController();
  List<TextEditingController> varianControllers = [TextEditingController()].obs;
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  RxList varianProductInformation = [].obs;
  int? productId;
  ImageHelper imageHelper = ImageHelper();
  RxList<File> images = <File>[].obs;
  var singleImage;
  List<String> imagePath = [];

  File? testFile;

  @override
  void onInit() {
    super.onInit();
    print('detail product on init');
    productDetailInformation = Get.arguments;
    formKey.value = GlobalKey<FormState>();

    namaProduct.text = productDetailInformation.value.data!.namaProduct!;
    harga.text = productDetailInformation.value.data!.harga!;
    spesifikasi.text = productDetailInformation.value.data!.spesifikasiProduct!;
    deskripsi.text = productDetailInformation.value.data!.deskripsi!;
    linkShopee.text = productDetailInformation.value.data!.linkShopee!;
    stok.text = productDetailInformation.value.data!.stok!;
    productId = productDetailInformation.value.data!.id;
    parsingProductDetailVariantoVariansProduct();
    // print(varianProductInformation);
    // print();
    // varianProductInformation.addAll(productDetailInformation.ba)
    // varianControllers.addAll(productDetailInformation.value.data!.varians);

    // varianControllers = productDetailInformation.value.data!.varians
    //         ?.map((_) => TextEditingController())
    //         .toList() ??
    //     [];

    // imageFiletoList();
  }

  @override
  void onReady() async {
    super.onReady();
    print('edit on ready');
    print(varianControllers.length);
    print('run url to Image');
    print(productDetailInformation.value.data!.fotos![0].url!);
    // testFile =
    //     await urlToImage(productDetailInformation.value.data!.fotos![0].url!);
    print('run url to Image result');
    imageFiletoList(); // Panggil fungsi ini untuk memuat gambar ke dalam `images`.
    print('after imageToFile');
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addPathImage() {
    for (File file in images) {
      imagePath.add(file.path);
    }
    // print(imagePath);
  }

  Future<void> editProduct() async {
    imagePath.clear();
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

    try {
      print('fetch to api');
      print(imagePath);
      final response = await productProvider.editProduct(
          productId!, imagePath, varianValues, data);
      if (response.statusCode == 200) {
        print(response.data);
        images.clear();
        imagePath.clear();
        print('success update');
        Get.offAllNamed(Routes.HOME);
        Get.showSnackbar(snackBarSuccesfullyEditProduct());
      } else {
        Get.back();
        Get.showSnackbar(snackBarTimeOut());
        print(response.statusCode);
      }
    } catch (e) {}
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

  Future<File?> urlToImage(String imageUrl) async {
    try {
      final cacheManager = DefaultCacheManager();
      final file = await cacheManager.getSingleFile(imageUrl);
      return file;
    } catch (e) {
      print('Error loading image: $e');
      return null;
    }
  }

  void imageFiletoList() async {
    for (var foto in productDetailInformation.value.data?.fotos ?? []) {
      final file = await urlToImage(foto.url);
      // print(file?.path);
      if (file != null) {
        imagePath.add(file.path);
        images.add(file);
      }
    }
  }

  void parsingProductDetailVariantoVariansProduct() {
    varianControllers.clear(); // Hapus semua item sebelum menambahkan yang baru

    for (var varian in productDetailInformation.value.data!.varians!) {
      var controller = TextEditingController();
      controller.text = varian.jenisVarian!;
      varianControllers.add(controller);
    }
  }
}
