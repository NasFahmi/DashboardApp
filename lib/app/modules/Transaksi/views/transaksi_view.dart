import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:Pawonkoe/app/modules/Transaksi/views/barchart/barPendapatan.dart';
import 'package:Pawonkoe/app/theme/colors.dart';

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
                  Obx(
                    () => Text(
                      'Pendapatan di tahun ${controller.chartTransaksiInformation.value.data?.tahun}',
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Gap(20),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color: Color(0xfff3f4f6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF000000).withOpacity(0.08),
                          offset: Offset(-1, 3),
                          blurRadius: 14,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    height: 180.h,
                    width: Get.width,
                    child: lineChartPendapatan(),
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
                  controller.getDataChartTransaksi();
                  controller.getDataTransaksi();
                  // print(controller.sumValues);
                },
                child: Obx(
                  () => ListView.builder(
                    itemCount:
                        controller.transaksiInformation.value.data?.length,
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
                                        image: controller
                                                    .transaksiInformation
                                                    .value
                                                    .data?[index]
                                                    .products
                                                    ?.fotos
                                                    ?.first
                                                    .url !=
                                                null
                                            ? NetworkImage(
                                                '${controller.transaksiInformation.value.data?[index].products?.fotos?.first.url}')
                                            : AssetImage(
                                                    'assets/images/image_default.png')
                                                as ImageProvider<Object>,
                                        // Ensure that the image provider is explicitly cast to ImageProvider<Object>
                                      ),
                                    ),
                                  ),
                                  Gap(8.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.transaksiInformation.value.data?[index].products?.namaProduct}',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      // nama products, harga product, tanggal, status
                                      Text(
                                        'Harga = ${controller.transaksiInformation.value.data?[index].products?.harga}',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Gap(12),
                                      Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4.r),
                                              ),
                                              color:
                                                  AppColors.orangeColorPrimary,
                                            ),
                                            padding: EdgeInsets.all(4.w),
                                            child: Text(
                                              '${controller.transaksiInformation.value.data?[index].jumlah}',
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
                                              color: controller
                                                          .transaksiInformation
                                                          .value
                                                          .data?[index]
                                                          .isComplete ==
                                                      1
                                                  ? AppColors.greenColorPrimary
                                                  : AppColors.redColorPrimary,
                                            ),
                                            padding: EdgeInsets.all(4.w),
                                            child: Text(
                                              controller
                                                          .transaksiInformation
                                                          .value
                                                          .data?[index]
                                                          .isComplete ==
                                                      1
                                                  ? 'Selesai'
                                                  : 'Belum Selesai',
                                              style: TextStyle(
                                                color:
                                                    AppColors.backgroundColor,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                '${controller.transaksiInformation.value.data?[index].tanggal}',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  LineChart lineChartPendapatan() {
    // print(controller.Bulan);
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.grey.shade200,
            getTooltipItems: (List<LineBarSpot> touchedSpots) {
              return touchedSpots.map((LineBarSpot touchedSpot) {
                final flSpot = touchedSpot;
                // Customize the tooltip content based on your data
                String tooltipText =
                    '${controller.chartTransaksiInformation.value.data?.bulan?[flSpot.x.toInt() - 1]} ${flSpot.y.toStringAsFixed(2)}';
                return LineTooltipItem(
                  tooltipText,
                  TextStyle(
                      color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                );
              }).toList();
            },
          ),
          handleBuiltInTouches: true,
          getTouchedSpotIndicator:
              (LineChartBarData barData, List<int> spotIndexes) {
            return spotIndexes.map((index) {
              return TouchedSpotIndicatorData(
                FlLine(color: Colors.blue, strokeWidth: 4),
                FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                    radius: 6,
                    color: Colors.blue,
                  ),
                ),
              );
            }).toList();
          },
        ),
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          leftTitles: AxisTitles(
            // Customize the appearance of the left axis titles
            sideTitles: SideTitles(
              reservedSize: 32,
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(
                  meta.formattedValue.toString(),
                );
              },
            ),
          ),
        ),
        minX: 1,
        maxX: 12,
        minY: 1,
        maxY: 5000000,
        gridData: FlGridData(
          show: false,
          drawHorizontalLine: true,
          drawVerticalLine: true,
          horizontalInterval:
              5000000, // Customize horizontal grid line interval
          verticalInterval: 6, // Customize vertical grid line interval
          checkToShowHorizontalLine: (value) => true,
          checkToShowVerticalLine: (value) => true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey
                  .withOpacity(0.5), // Customize horizontal grid line color
              strokeWidth: 0.5, // Customize horizontal grid line width
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey
                  .withOpacity(0.5), // Customize vertical grid line color
              strokeWidth: 0.5, // Customize vertical grid line width
            );
          },
        ),
        borderData: FlBorderData(
          show: false,
        ),
        lineBarsData: [
          LineChartBarData(
            color: AppColors.blueColorPrimary,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.blueColorThird, // Dark blue color at the top
                  AppColors.blueColorSecondary.withOpacity(
                      0.1), // Slightly transparent version at the bottom
                ],
              ),
            ),
            barWidth: 3.0,
            isCurved: true,
            spots: [
              ...List.generate(12, (index) {
                double toYValue = double.tryParse(controller
                            .chartTransaksiInformation
                            .value
                            .data
                            ?.dataPenjualan?[index] ??
                        '0') ??
                    0.0;
                return FlSpot(index + 1, toYValue);
              })
            ],
          )
        ],
      ),
    );
  }
}
