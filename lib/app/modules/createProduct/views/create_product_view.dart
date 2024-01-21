import 'dart:async';
import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:Pawonkoe/app/components/TextFormFieldComponent.dart';
import 'package:Pawonkoe/app/components/_SnackBarLoginError.dart';
import 'package:Pawonkoe/app/routes/app_pages.dart';
import 'package:Pawonkoe/app/theme/colors.dart';

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
                      regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
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
                      regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
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
                      regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
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
                      'Spesifikasi',
                      textAlign: TextAlign.start,
                      style: TextStyle(),
                    ),
                    const Gap(4),
                    TextFormFieldComponent(
                      controllerForm: controller.spesifikasi,
                      validationForm: 'Spesifikasi Product Tidak Boleh Kosong',
                      hintTextField: 'Spesifikasi Product',
                      regex: RegExp(r'^[a-zA-Z0-9 !@#$%^&*()-_+=]+$'),
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
                                          hintTextField: 'Varian ${index + 1}',
                                          regex: RegExp(r'^[a-zA-Z0-9]+$'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gap(8.w),
                                  IconButton(
                                    onPressed: () {
                                      if (controller.varianControllers.length >
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
                    controller.images.isNotEmpty
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: controller.images.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(12)),
                                      child: Image(
                                        width: 100.w,
                                        height: 100.w,
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                          controller.images[index],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -10,
                                      right: -10,
                                      child: Container(
                                        width: 24.w,
                                        height: 24.h,
                                        decoration: const BoxDecoration(
                                          color: AppColors.redColorThirdy,
                                          shape: BoxShape.circle,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.images.removeAt(index);
                                          },
                                          child: Icon(
                                            FluentIcons.delete_24_regular,
                                            size: 14.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        : const Text('Upload Foto'),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.greenThird,
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              // minimumSize: Size(Get.width / 2, 40.h),
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
                        ),
                        const Gap(20),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blueColorThird,
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              // fixedSize: Size(Get.width / 2, 40.h),
                              foregroundColor: AppColors.backgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.r),
                                ),
                              ),
                            ),
                            onPressed: () {
                              ModalBottomSheetImagePicker(context);
                            },
                            child: const Text('Pilih Gambar'),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    GestureDetector(
                      onTap: () {
                        if (controller.formKey.value.currentState?.validate() ??
                            false) {
                          // controller.addPathImage();
                          confirmDialog();
                          // controller.uploadProduct();
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
      ),
    );
  }

  Future<dynamic> confirmDialog() {
    return Get.defaultDialog(
      contentPadding: EdgeInsets.only(bottom: 16.h, top: 12.h),
      titlePadding: EdgeInsets.only(top: 12.h),
      backgroundColor: AppColors.backgroundColorSecoundary,
      title: "Buat Product",
      titleStyle: TextStyle(
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.w800,
        fontSize: 18.sp,
      ),
      // textConfirm: 'Apakah Informasi Product Sudah Benar?',
      radius: 16.r,
      content: Container(
        // height: 1,
        width: Get.width / 1,
        child: Center(
          child: Column(
            children: [
              Text(
                'Apakah Informasi Product Sudah Benar?',
                style: TextStyle(
                  color: AppColors.labelTextColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Gap(4),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: Size(Get.width / 2.75, 40.h),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.secondaryTextColor,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
          ),
          onPressed: () {
            Get.back(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            elevation: 0,
            minimumSize: Size(Get.width / 2.75, 40.h),
            backgroundColor: Colors.blue.shade600,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.secondaryTextColor,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.r),
              ),
            ),
          ),
          onPressed: () async {
            await controller.uploadProduct().timeout(
              const Duration(seconds: 15),
              onTimeout: () {
                throw TimeoutException('error timeout running');
              },
            );
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }

  Future<dynamic> ModalBottomSheetImagePicker(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Gap(20),
            Text(
              'Pilih Gambar Melalui',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Gap(16),
            ListTile(
              leading: const Icon(FluentIcons.image_24_regular),
              title: const Text('Gallery'),
              onTap: () async {
                final List<XFile> files =
                    await controller.imageHelper.pickImage(multiple: true);
                controller.images
                    .addAll(files.map((e) => File(e.path)).toList());
              },
            ),
            ListTile(
              leading: const Icon(FluentIcons.camera_24_regular),
              title: const Text('Kamera'),
              onTap: () async {
                final file = await controller.imageHelper.pickCamera();
                if (file != null) {
                  final croppedFile = await controller.imageHelper.crop(
                    file: file,
                    cropStyle: CropStyle.rectangle,
                  );
                  if (croppedFile != null) {
                    controller.singleImage = File(croppedFile.path);
                    controller.images.add(controller.singleImage!);
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
