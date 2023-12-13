import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pawonkoe/app/components/TextFormFieldComponent.dart';
import 'package:pawonkoe/app/theme/colors.dart';

import '../controllers/create_product_controller.dart';

class CreateProductView extends GetView<CreateProductController> {
  const CreateProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaProduct = TextEditingController();
    final TextEditingController hargaRendah = TextEditingController();
    final TextEditingController hargaTinggi = TextEditingController();
    final TextEditingController deskripsi = TextEditingController();
    final TextEditingController linkShopee = TextEditingController();
    final TextEditingController stok = TextEditingController();
    final TextEditingController spesifikasi = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Product',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Product',
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                  ),
                  Gap(4),
                  TextFormFieldComponent(
                    controllerForm: namaProduct,
                    validationForm: 'Nama Product Tidak Boleh Kosong',
                    hintTextField: 'Nama Product',
                    // regex: RegExp(r'^[a-zA-Z0-9]+$'),
                  ),
                  Text(
                    'Harga',
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                  ),
                  Gap(4),
                  SizedBox(
                    width: Get.width * 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormFieldComponent(
                            controllerForm: hargaRendah,
                            validationForm: 'Harga Tidak Boleh Kosong',
                            hintTextField: 'Harga Rendah',
                            // regex: RegExp(r'^[0-9]*$'),
                          ),
                        ),
                        Gap(8),
                        Expanded(
                          child: TextFormFieldComponent(
                            controllerForm: hargaTinggi,
                            validationForm: 'Harga Tidak Boleh Kosong',
                            hintTextField: 'Harga Tinggi',
                            // regex: RegExp(r'^[0-9]*$'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Deskripsi',
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                  ),
                  Gap(4),
                  TextFormFieldComponent(
                    validationForm: 'Derksipsi Tidak Boleh Kosong',
                    controllerForm: deskripsi,
                    hintTextField: 'Deskripsi',
                  ),
                  Text(
                    'Link Shopee',
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                  ),
                  Gap(4),
                  TextFormFieldComponent(
                    validationForm: 'Link Shopee Tidak Boleh Kosong',
                    controllerForm: linkShopee,
                    hintTextField: 'Link Shopee',
                  ),
                  Text(
                    'Stok',
                    textAlign: TextAlign.start,
                    style: TextStyle(),
                  ),
                  Gap(4),
                  TextFormFieldComponent(
                    validationForm: 'Stok Tidak Boleh Kosong',
                    controllerForm: stok,
                    hintTextField: 'Stok',
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: controller.beratJenis.keys.map((String e) {
                      return Obx(
                        () => CheckboxListTile(
                          title: Text(e),
                          value: controller.beratJenis[e]!,
                          onChanged: (bool? value) {
                            controller.beratJenis[e] = value!;
                          },
                        ),
                      );
                    }).toList(),
                    // Mengurangi margin antara CheckboxListTile
                    padding: EdgeInsets.zero,
                    // Menyesuaikan padding untuk isi dari ListTile
                    // Ini akan mengurangi margin internal dari CheckboxListTile
                    itemExtent: 40, // Ubah nilai ini sesuai kebutuhan
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
