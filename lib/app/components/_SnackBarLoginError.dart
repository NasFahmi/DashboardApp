import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pawonkoe/app/theme/colors.dart';

GetSnackBar snackBarLoginErrors() {
  return GetSnackBar(
    animationDuration: Duration(milliseconds: 900),
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.transparent,
    maxWidth: Get.width / 1.50,
    messageText: Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.warningColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/sad.svg',
            width: 30.w,
          ),
          Gap(8.h),
          Text(
            'Oh Snapp!!',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.backgroundColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap(2.h),
          Text(
            'Username Atau Password Salah',
            style: TextStyle(
              color: AppColors.backgroundColorSecoundary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

GetSnackBar snackBarLoginErrorsEmpty() {
  return GetSnackBar(
    animationDuration: Duration(milliseconds: 900),
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.transparent,
    maxWidth: Get.width / 1.50,
    messageText: Container(
      padding: EdgeInsets.symmetric(
        vertical: 12.h,
        horizontal: 20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.warningColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/sad.svg',
            width: 30.w,
          ),
          Gap(8.h),
          Text(
            'Oh Snapp!!',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.backgroundColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          Gap(2.h),
          Text(
            textAlign: TextAlign.center,
            'Username Atau Password Tidak Boleh Kosong',
            style: TextStyle(
              color: AppColors.backgroundColorSecoundary,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
