import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/routes/app_pages.dart';
import 'package:pawonkoe/app/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<DetailProductController>().refresh();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  ProductPreview(),
                  AppBarCostum(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: shopeeButton(controller),
            ),
          ],
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
        onPressed: () {
          Get.offAndToNamed(Routes.HOME);
        },
        icon: const Icon(FluentIcons.arrow_left_24_regular),
      ),
    );
  }
}

Column ProductPreview() {
  final DetailProductController controller = Get.find();
  // List<String> list = [
  //   'assets/images/test.jpg',
  //   'assets/images/test.jpg',
  //   'assets/images/test.jpg',
  //   'assets/images/test.jpg',
  //   'assets/images/test.jpg'
  // ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Obx(
        () => Container(
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 10 / 9,
              enableInfiniteScroll: true,
            ),
            items: (controller.productDetailInformation.value.data?.fotos ?? [])
                .map(
                  (e) => ClipRRect(
                    child: Image(
                      fit: BoxFit.cover,
                      image: e.url != null
                          ? NetworkImage(e.url!)
                          : AssetImage('assets/images/image_default.png')
                              as ImageProvider<Object>,
                      // Ensure that the image provider is explicitly cast to ImageProvider<Object>
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      ContentDetails()
    ],
  );
}

Container ContentDetails() {
  final DetailProductController controller = Get.find();
  return Container(
    decoration: BoxDecoration(
      color: AppColors.backgroundColor,
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Text(
              "${controller.productDetailInformation.value.data?.namaProduct ?? " "}",
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.primaryTextColor,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  'Rp. ${controller.productDetailInformation.value.data?.harga ?? "0"}',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.shopeeColor,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  'Stok ${controller.productDetailInformation.value.data?.stok ?? "0"}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          Gap(16),
          Text(
            'Deskripsi',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gap(8),
          Obx(
            () => Text(
              '${controller.productDetailInformation.value.data?.deskripsi ?? "0"}',
              style: TextStyle(
                color: AppColors.labelTextColor,
              ),
            ),
          ),
          Gap(8),
          Text(
            'Varian',
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(4),
          Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                controller
                        .productDetailInformation.value.data?.varians?.length ??
                    0,
                (index) {
                  return Text(
                    '${controller.productDetailInformation.value.data?.varians?[index].jenisVarian ?? ''}',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.labelTextColor,
                    ),
                  );
                },
              ).toList(), // Convert the List<Text> to List<Widget>
            ),
          ),
          // if (controller.productDetailInformation.value.data?.varians != null)
          //   ListView.builder(
          //     shrinkWrap: true,
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: controller
          //         .productDetailInformation.value.data?.varians?.length,
          //     itemBuilder: (context, index) {
          //       // Use ListTile with a Divider
          //       return Text(
          //         '${controller.productDetailInformation.value.data?.varians?[index].jenisVarian ?? ''}',
          //         style: TextStyle(
          //           fontSize: 16.sp,
          //           color: AppColors.labelTextColor,
          //         ),
          //       );
          //     },
          //   ),
        ],
      ),
    ),
  );
}

ElevatedButton shopeeButton(DetailProductController controller) {
  return ElevatedButton(
    onPressed: () async {
      String url =
          '${controller.productDetailInformation.value.data?.linkShopee}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    },
    style: ElevatedButton.styleFrom(
      fixedSize: Size(Get.width, 42.h),
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
  );
}
