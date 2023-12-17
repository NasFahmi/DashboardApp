import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/modules/Transaksi/views/barchart/barPendapatan.dart';
import 'package:pawonkoe/app/theme/colors.dart';

import '../controllers/transaksi_controller.dart';

class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<TransaksiController>().refresh();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pendapatan & Transaksi',
          style: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pendapatan 30 Hari Terakhir',
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '*Setiap Bar mewakili 5 hari',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.labelTextColor,
                    ),
                  ),
                  Gap(20),
                  SizedBox(
                    height: 160.h,
                    child: BarDataPendapatan(),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text('List Transaksi'),
            ),
            Gap(8),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  print('refresh');
                },
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.w,
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
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Total Harga : 20.000',
                                      style: TextStyle(
                                        fontSize: 12.sp,
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
                                        // Container(
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.all(
                                        //       Radius.circular(4.r),
                                        //     ),
                                        //     color: AppColors.redColorPrimary,
                                        //   ),
                                        //   padding: EdgeInsets.all(4.w),
                                        //   child: Text(
                                        //     'Belum Selesai',
                                        //     style: TextStyle(
                                        //         color: AppColors.backgroundColor,
                                        //         fontSize: 10.sp,
                                        //         fontWeight: FontWeight.w700),
                                        //   ),
                                        // ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4.r),
                                            ),
                                            color: AppColors.greenColorPrimary,
                                          ),
                                          padding: EdgeInsets.all(4.w),
                                          child: Text(
                                            'Selesai',
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
                            Text(
                              '2023-09-20',
                              style: TextStyle(fontSize: 12.sp),
                            ),
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
