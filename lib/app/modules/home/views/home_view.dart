import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pawonkoe/app/modules/Produk/controllers/produk_controller.dart';
import 'package:pawonkoe/app/modules/Transaksi/controllers/transaksi_controller.dart';
import '../controllers/home_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import '../../../../app/theme/colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.Pages[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GNav(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: Colors.white,
            tabBorderRadius: 20,
            tabBackgroundColor: AppColors.blueColorPrimary,
            padding: const EdgeInsets.all(16),
            selectedIndex: controller.selectedIndex.value,
            onTabChange: (index) {
              controller.selectedIndex.value = index;
            },
            tabs: [
              GButton(
                icon: FluentIcons.home_24_regular,
                gap: 8,
                text: 'Home',
              ),
              GButton(
                icon: FluentIcons.box_24_regular,
                gap: 8,
                text: 'Produk',
              ),
              GButton(
                icon: FluentIcons.wallet_16_regular,
                gap: 8,
                text: 'Transaksi',
              ),
              GButton(
                icon: FluentIcons.book_16_regular,
                text: 'Notes',
                gap: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
