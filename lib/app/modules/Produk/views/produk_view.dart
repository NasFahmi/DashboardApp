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
              child: Container(
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
                                  decoration: BoxDecoration(
                                    color: Colors.white38,
                                    shape: BoxShape.rectangle,
                                    //
                                    border: Border.all(
                                      color: AppColors.cardColor,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                          child: SizedBox(
                                            width: Get.width / 2.25,
                                            height: 100.h,
                                            // color: Colors.amber,
                                            // alignment: Alignment.center,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              child: Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    '${controller.productInformation.value.data?[index].fotos?.first.url}'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Gap(4.h),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${controller.productInformation.value.data?[index].namaProduct}',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .primaryTextColor,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                              Text(
                                                maxLines: 2,
                                                '${controller.productInformation.value.data?[index].deskripsi}',
                                                style: TextStyle(
                                                  color:
                                                      AppColors.labelTextColor,
                                                  fontSize: 10.sp,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Gap(4.h),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Rp ${controller.productInformation.value.data?[index].harga}',
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: AppColors
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Text(
                                                    'Stok : ${controller.productInformation.value.data?[index].stok}',
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: AppColors
                                                          .labelTextColor,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
