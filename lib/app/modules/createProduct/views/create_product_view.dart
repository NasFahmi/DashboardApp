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
    // final TextEditingController spesifikasi = TextEditingController();
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
              child: Obx(
                () => Form(
                  key: controller.formKey.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nama Product',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      const Gap(4),
                      TextFormFieldComponent(
                        controllerForm: controller.namaProduct,
                        validationForm: 'Nama Product Tidak Boleh Kosong',
                        hintTextField: 'Nama Product',
                        regex: RegExp(r'^[a-zA-Z0-9]+$'),
                      ),
                      const Text(
                        'Harga',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      const Gap(4),
                      TextFormFieldComponent(
                        controllerForm: controller.harga,
                        validationForm: 'Harga Tidak Boleh Kosong',
                        hintTextField: 'Harga Product',
                        regex: RegExp(r'^[0-9]*$'),
                      ),
                      const Text(
                        'Deskripsi',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      const Gap(4),
                      TextFormFieldComponent(
                        validationForm: 'Derksipsi Tidak Boleh Kosong',
                        controllerForm: controller.deskripsi,
                        hintTextField: 'Deskripsi',
                        regex: RegExp(r'^[a-zA-Z0-9]+$'),
                      ),
                      const Text(
                        'Link Shopee',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      const Gap(4),
                      TextFormFieldComponent(
                        validationForm: 'Link Shopee Tidak Boleh Kosong',
                        controllerForm: controller.linkShopee,
                        hintTextField: 'Link Shopee',
                        regex: RegExp(r'^[a-zA-Z0-9]+$'),
                      ),
                      const Text(
                        'Stok',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      const Gap(4),
                      TextFormFieldComponent(
                        validationForm: 'Stok Tidak Boleh Kosong',
                        controllerForm: controller.stok,
                        hintTextField: 'Stok',
                        regex: RegExp(r'^[a-zA-Z0-9]+$'),
                      ),
                      const Text(
                        'Berat',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                      const Gap(4),
                      TextFormFieldComponent(
                        controllerForm: controller.beratJenis,
                        validationForm: 'Berat jenis Tidak Boleh Kosong',
                        hintTextField: 'Berat jenis Product',
                        regex: RegExp(r'^[0-9]*$'),
                      ),
                      const Gap(4),
                      const Text('Varian'),
                      const Gap(4),
                      Obx(
                        () => ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          itemCount: controller.varianControllers.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                      () => Expanded(
                                        child: Container(
                                          child: TextFormFieldComponent(
                                            validationForm:
                                                'Varian ${index + 1} tidak boleh kosong',
                                            controllerForm: controller
                                                .varianControllers[index],
                                            hintTextField:
                                                'Varian ${index + 1}',
                                            regex: RegExp(r'^[a-zA-Z0-9]+$'),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(8.w),
                                    IconButton(
                                      onPressed: () {
                                        if (controller
                                                .varianControllers.length >
                                            1) {
                                          controller.varianControllers
                                              .removeAt(index);
                                          print(controller
                                              .varianControllers.length);
                                        }
                                      },
                                      icon: const Icon(
                                        FluentIcons.delete_24_regular,
                                      ),
                                      color: AppColors.redColorPrimary,
                                    )
                                  ],
                                ),
                                const Divider()
                              ],
                            );
                          },
                        ),
                      ),
                      const Gap(8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColorPrimary,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          fixedSize: Size(140.w, 40.h),
                          foregroundColor: AppColors.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                          ),
                        ),
                        onPressed: () {
                          controller.varianControllers
                              .add(TextEditingController());
                          print(controller.varianControllers.length);
                        },
                        child: const Text('Tambah Varian'),
                      ),
                      const Gap(16),
                      GestureDetector(
                        onTap: () {
                          if (controller.formKey.value.currentState
                                  ?.validate() ??
                              false) {
                            // All form fields are valid, proceed with submission
                            // You may want to call a function here to handle submission
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                            color: AppColors.blueColorPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
