import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/theme/colors.dart';
import 'package:pawonkoe/app/components/_card_dashboard.dart';
import '../controllers/dashboard_controller.dart';
import 'package:intl/intl.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DashboardController>().refresh();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: AppColors.secondaryTextColor, fontSize: 16.sp),
                ),
                Text(
                  'Super Admin',
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: AppColors.blueColorPrimary,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
              child: Icon(
                FluentIcons.person_12_regular,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getDataDashboard();
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(
                  () => Text(
                    DateFormat('HH.mm dd MMMM yyyy')
                        .format(controller.dateTime.value),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Obx(
                      () => CardDashboard(
                        iconCard: Icon(FluentIcons.cart_24_regular),
                        backgroundCardColor: AppColors.blueColorSecondary,
                        backgroundIconColor: AppColors.blueColorPrimary,
                        nameCard: 'Orders',
                        valueCard:
                            '${controller.dashboardData.value.data?.card?.totalOrder.toString()} Orders',
                      ),
                    ),
                    Obx(
                      () => CardDashboard(
                        iconCard:
                            Icon(FluentIcons.currency_dollar_euro_20_regular),
                        backgroundCardColor: AppColors.redColorSecoundary,
                        backgroundIconColor: AppColors.redColorPrimary,
                        nameCard: 'Produk Terjual',
                        valueCard:
                            '${controller.dashboardData.value.data?.card?.totalProductTerjual.toString()} Product',
                      ),
                    ),
                    Obx(
                      () {
                        String rawString = controller
                                .dashboardData.value.data?.card?.totalPendapatan
                                .toString() ??
                            "0";

                        // Mengonversi string ke dalam bentuk angka
                        int numericValue = int.tryParse(
                                rawString.replaceAll(RegExp(r'[^0-9]'), '')) ??
                            0;

                        // Membuat format angka dengan pemisah ribuan
                        String formattedValue = NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp ',
                                decimalDigits: 0)
                            .format(numericValue);

                        // Tampilkan hasilnya
                        return CardDashboard(
                          iconCard: Icon(FluentIcons.data_trending_20_regular),
                          backgroundCardColor: AppColors.greenColorSecoundary,
                          backgroundIconColor: AppColors.greenColorPrimary,
                          nameCard: 'Pendapatan',
                          valueCard: formattedValue,
                        );
                      },
                    ),
                    Obx(
                      () => CardDashboard(
                        iconCard: Icon(FluentIcons.clock_24_regular),
                        backgroundCardColor: AppColors.yellowColorSecoundary,
                        backgroundIconColor: AppColors.yellowColorPrimary,
                        nameCard: 'PreOrder',
                        valueCard:
                            '${controller.dashboardData.value.data?.card?.totalPreorder} Preorder',
                      ),
                    ),
                  ],
                ),
              ),
              // !
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produk',
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'See All',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          FluentIcons.chevron_right_24_regular,
                          size: 18.sp,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(12.h),
              Obx(() => SizedBox(
                    height: 140.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          controller.dashboardData.value.data?.product?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 140.w,
                          margin: EdgeInsets.only(left: 16.w),
                          height: 140.h,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColorSecoundary,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Obx(
                                  () => SizedBox(
                                    height: 85.h,
                                    width: 150.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: Image(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            '${controller.dashboardData.value.data?.product?[index].fotos?.first.url}'
                                            ' '),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(4.h),
                                Obx(
                                  () => Text(
                                    '${controller.dashboardData.value.data?.product?[index].namaProduct.toString()}',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.primaryTextColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    'Harga : ${controller.dashboardData.value.data?.product?[index].harga.toString()}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.labelTextColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
              Gap(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Produk Sales',
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'View Detail',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          FluentIcons.chevron_right_24_regular,
                          size: 18.sp,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(12.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(width: 2, color: AppColors.strokeColor),
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.r),
                    ),
                    color: AppColors.backgroundColorSecoundary,
                  ),
                  child: DataTable(
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text('#'),
                        numeric: true,
                      ),
                      DataColumn(
                        label: Text('Nama Produk'),
                        numeric: false,
                      ),
                      DataColumn(
                        label: Text('Terjual'),
                        numeric: true,
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      controller.dashboardData.value.data?.topSalesProduct
                              ?.length ??
                          0,
                      (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: AppColors.primaryTextColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          DataCell(
                            Obx(() => Text(
                                  controller.dashboardData.value.data
                                          ?.topSalesProduct?[index]?.namaProduct
                                          .toString() ??
                                      '',
                                  style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: 16.sp,
                                  ),
                                )),
                          ),
                          DataCell(
                            Obx(() => Text(
                                  controller.dashboardData.value.data
                                          ?.topSalesProduct?[index]?.terjual
                                          .toString() ??
                                      '',
                                  style: TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: 16.sp,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(16.w),
                ),
              ),
              Gap(16.h)
            ],
          ),
        ),
      ),
    );
  }
}
