import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:pawonkoe/app/theme/colors.dart';

import '../controllers/notes_pre_order_controller.dart';

class NotesPreOrderView extends GetView<NotesPreOrderController> {
  const NotesPreOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<NotesPreOrderController>().refresh();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List PreOrder',
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintText: 'Search a name or product',
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
                      fixedSize: Size(140.w, 40.h),
                      foregroundColor: AppColors.backgroundColor,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                          'Add Preorder',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 20.sp,
                          color: AppColors.backgroundColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  print('refresh');
                },
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: AppColors.silverTextColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.r),
                          ),
                          color: Colors.white12,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w,
                          vertical: 8.h,
                        ),
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: Get.width / 3.5,
                                  height: 80.h,
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
                                Gap(8.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Product A',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      'Jhone Doe',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Total Harga : ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      'Down Payment : ',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Gap(12),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4.r),
                                            ),
                                            color: AppColors.orangeColorPrimary,
                                          ),
                                          padding: EdgeInsets.all(4.w),
                                          child: Text(
                                            '20',
                                            style: TextStyle(
                                                color:
                                                    AppColors.backgroundColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Gap(8),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4.r),
                                            ),
                                            color: AppColors.redColorPrimary,
                                          ),
                                          padding: EdgeInsets.all(4.w),
                                          child: Text(
                                            'Belum Selesai',
                                            style: TextStyle(
                                                color:
                                                    AppColors.backgroundColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Icon(Icons.more_vert),
                                ),
                                Gap(32.h),
                                Text(
                                  '2023-09-20',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
