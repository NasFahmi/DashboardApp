import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/theme/colors.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              ProductPreview(),
              AppBarCostum(),
            ],
          ),
        ),
      ),
    );
  }

  Column AppBarCostum() {
    return Column(
      children: [
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: AppBarButtonBack(),
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FluentIcons.edit_24_regular,
                      color: AppColors.greenColorPrimary,
                    ),
                  ),
                ),
                const Gap(16),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FluentIcons.delete_24_regular,
                      color: AppColors.redColorPrimary,
                    ),
                  ),
                ),
                const Gap(20),
              ],
            )
          ],
        )
      ],
    );
  }

  Container AppBarButtonBack() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(FluentIcons.arrow_left_24_regular),
      ),
    );
  }
}

Column ProductPreview() {
  List<String> list = [
    'assets/images/test.jpg',
    'assets/images/test.jpg',
    'assets/images/test.jpg',
    'assets/images/test.jpg',
    'assets/images/test.jpg'
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 10 / 9,
            enableInfiniteScroll: true,
          ),
          items: list
              .map(
                (e) => ClipRRect(
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(e),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product A"),
            Text('Rp. 10.000'),
            Text('Deskripsi'),
            Text('Stok 120'),
            Text('Varian'),
            ...List.generate(3, (index) => Text('${index}')),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.r),
                  ),
                ),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.shopeeColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    width: 20,
                    image: AssetImage('assets/images/shopee_logo.png'),
                  ),
                  Gap(16),
                  Text(
                    'Shopee',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
