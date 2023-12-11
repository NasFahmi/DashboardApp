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
                  CardDashboard(
                    iconCard: Icon(FluentIcons.cart_24_regular),
                    backgroundCardColor: AppColors.blueColorSecondary,
                    backgroundIconColor: AppColors.blueColorPrimary,
                    nameCard: 'Orders',
                    valueCard: '42 Orders',
                  ),
                  CardDashboard(
                    iconCard: Icon(FluentIcons.currency_dollar_euro_20_regular),
                    backgroundCardColor: AppColors.redColorSecoundary,
                    backgroundIconColor: AppColors.redColorPrimary,
                    nameCard: 'Produk Terjual',
                    valueCard: '427 Produk',
                  ),
                  CardDashboard(
                    iconCard: Icon(FluentIcons.data_trending_20_regular),
                    backgroundCardColor: AppColors.greenColorSecoundary,
                    backgroundIconColor: AppColors.greenColorPrimary,
                    nameCard: 'Pendapatan',
                    valueCard: 'Rp. 150.000,-',
                  ),
                  CardDashboard(
                    iconCard: Icon(FluentIcons.clock_24_regular),
                    backgroundCardColor: AppColors.yellowColorSecoundary,
                    backgroundIconColor: AppColors.yellowColorPrimary,
                    nameCard: 'PreOrder',
                    valueCard: '4 PreOrder',
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
            SizedBox(
              height: 140.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (index < 4) {
                    return Container(
                      width: 140.w,
                      margin: EdgeInsets.only(left: 16.w),
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColorSecoundary,
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Image(
                                height: 60,
                                image: AssetImage('assets/images/snack.png'),
                              ),
                            ),
                            Gap(4.h),
                            Text(
                              'Produk A',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      width: 100.w,
                      margin: EdgeInsets.only(left: 16.w, right: 16.w),
                      height: 140.h,
                      decoration: BoxDecoration(
                        color: AppColors.redColorSecoundary,
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(child: Text("See All")),
                    );
                  }
                },
              ),
            ),
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
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text(
                            '1',
                            style: TextStyle(
                              color: AppColors.goldTextColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3.5,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.goldTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            '150',
                            style: TextStyle(
                              color: AppColors.goldTextColor,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '2',
                          style: TextStyle(
                            color: AppColors.silverTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.silverTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '100',
                          style: TextStyle(
                            color: AppColors.silverTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '3',
                          style: TextStyle(
                            color: AppColors.bronzeTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.bronzeTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.bronzeTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '4',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '5',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '6',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '7',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '8',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '9',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          '10',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                        DataCell(
                          SizedBox(
                            width: Get.width / 3,
                            child: Text(
                              'Cumi Bakar Varian Pedas diskon',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 16.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        DataCell(Text(
                          '50',
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 16.sp,
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.w),
              ),
            ),
            Gap(16.h)
          ],
        ),
      ),
    );
  }
}
