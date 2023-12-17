import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pawonkoe/app/routes/app_pages.dart';
import 'package:pawonkoe/app/theme/colors.dart';

import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  const ProdukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<ProdukController>().refresh();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Produk',
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeaderProduct(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    print('refresh');
                    controller.getdataListProduct();
                  },
                  child: controller.productInformation.value.data != null &&
                          controller.productInformation.value.data!.isNotEmpty
                      ? GridView.count(
                          childAspectRatio: 10 / 12,
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                          children: List.generate(
                            controller.productInformation.value.data!.length,
                            (index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.DETAIL_PRODUCT,
                                    arguments: controller.productInformation
                                        .value.data?[index].id,
                                  );
                                },
                                child: Container(
                                    // Your existing code for product items...
                                    ),
                              );
                            },
                          ),
                        )
                      : Center(
                          // Display a message or widget when there are no products
                          child: Text(
                            'No products available.',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding HeaderProduct() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(fontSize: 14.sp),
              decoration: InputDecoration(
                hintText: 'Search a Product',
                hintStyle: TextStyle(fontSize: 14.sp),
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 1.0.h, horizontal: 15.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.r,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.w,
                    color: AppColors.silverTextColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.w,
                    color: AppColors.blueColorPrimary,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
              ),
            ),
          ),
          Gap(8.w),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueColorPrimary,
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
              Get.toNamed(Routes.CREATE_PRODUCT);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add Produk',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Icon(
                  Icons.add,
                  size: 24.w,
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
