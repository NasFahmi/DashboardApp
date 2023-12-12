import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pawonkoe/app/theme/colors.dart';

import '../controllers/produk_controller.dart';

class ProdukView extends GetView<ProdukController> {
  const ProdukView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.all(16.0),
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
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 1.0.h, horizontal: 15.0),
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
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      fixedSize: Size(140.w, 40.h),
                      foregroundColor: AppColors.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                    ),
                    onPressed: () {},
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
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: GridView.count(
                  childAspectRatio: 10 / 12,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  children: List.generate(
                    10, // Number of items in the grid
                    (index) {
                      return Container(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: Get.width / 2.25,
                                  height: 100.h,
                                  // color: Colors.amber,
                                  // alignment: Alignment.center,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/images/test.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                              // Gap(4.h),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Product A',
                                      style: TextStyle(
                                          color: AppColors.primaryTextColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      maxLines: 2,
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.  ',
                                      style: TextStyle(
                                        color: AppColors.labelTextColor,
                                        fontSize: 10.sp,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Gap(4.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Rp 15.000',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.primaryTextColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          'Stok : 120',
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: AppColors.labelTextColor,
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
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
