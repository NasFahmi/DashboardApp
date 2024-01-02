import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
                  SizedBox(
                    height: 160.h,
                    child: barChartPendapatan(),
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

  BarChart barChartPendapatan() {
    List bulan = controller.Bulan.value;
    return BarChart(
      BarChartData(
        maxY: 5000000,
        minY: 0,
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 1:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Jan'),
                    );
                  case 2:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Feb'),
                    );
                  case 3:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Mar'),
                    );
                  case 4:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Apr'),
                    );
                  case 5:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Mei'),
                    );
                  case 6:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Jun'),
                    );
                  case 7:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Jul'),
                    );
                  case 8:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Ags'),
                    );
                  case 9:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Sep'),
                    );
                  case 10:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Okt'),
                    );
                  case 11:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Nov'),
                    );
                  case 12:
                    return Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text('Des'),
                    );
                  default:
                    return Text('');
                }
              },
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueAccent,
            tooltipRoundedRadius: 8,
            tooltipPadding: EdgeInsets.all(8),
            tooltipMargin: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String value =
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                      .format(rod.toY);
              return BarTooltipItem(
                '${controller.chartTransaksiInformation.value.data?.bulan?[groupIndex]} $value',
                TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        barGroups: [
          ...List.generate(12, (index) {
            double toYValue = double.tryParse(controller
                        .chartTransaksiInformation
                        .value
                        .data
                        ?.dataPenjualan?[index] ??
                    '0') ??
                0.0;
            // Check if there's data available for the current index

            return BarChartGroupData(
              x: index + 1,
              barRods: [
                BarChartRodData(
                  toY: toYValue,
                  color: AppColors.blueColorPrimary,
                  width: 20.w,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.r),
                  ),
                  backDrawRodData: BackgroundBarChartRodData(
                    fromY: 0,
                    show: true,
                    color: AppColors.BackDataChart,
                    toY: 5000000,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('MAR', style: style);
      break;
    case 5:
      text = const Text('JUN', style: style);
      break;
    case 8:
      text = const Text('SEP', style: style);
      break;
    case 11:
      text = const Text('MAR', style: style);
      break;
    case 14:
      text = const Text('JUN', style: style);
      break;
    case 17:
      text = const Text('SEP', style: style);
      break;
    case 20:
      text = const Text('MAR', style: style);
      break;
    case 23:
      text = const Text('JUN', style: style);
      break;
    case 26:
      text = const Text('SEP', style: style);
      break;
    case 30:
      text = const Text('MAR', style: style);
      break;

    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = '10K';
      break;
    case 3:
      text = '30k';
      break;
    case 5:
      text = '50k';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.left);
}

LineChart lineChartPendapatan() {
  return LineChart(
    LineChartData(
      minX: 0,
      maxX: 15,
      minY: 0,
      maxY: 8,
      gridData: FlGridData(
        show: false,
      ),
      borderData: FlBorderData(
        show: true,
      ),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 3.1),
            FlSpot(4, 4),
            FlSpot(5.5, 3),
            FlSpot(6, 4),
            FlSpot(7, 3),
            FlSpot(8, 2),
            FlSpot(9, 5),
            FlSpot(10, 3.1),
            FlSpot(11, 4),
            FlSpot(12, 3),
            FlSpot(13, 4),
            FlSpot(14, 4),
            FlSpot(15, 3),
            // FlSpot(16, 2),
            // FlSpot(17, 5),
            // FlSpot(18, 3.1),
            // FlSpot(19, 4),
            // FlSpot(20, 3),
            // FlSpot(21, 4),
            // FlSpot(22, 3),
            // FlSpot(23, 2),
            // FlSpot(24, 5),
            // FlSpot(25, 3.1),
            // FlSpot(26, 4),
            // FlSpot(27, 3),
            // FlSpot(28, 4),
            // FlSpot(29, 4),
          ],
        )
      ],
    ),
  );
}
