import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawonkoe/app/theme/colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(40),
              SvgPicture.asset(
                'assets/images/login-ilustration.svg',
                width: 400.w,
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 32.sp,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Login to continue using the app',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(20.h),
              Text(
                'Username',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(8.h),
              usernameTextField(),
              Gap(16.h),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(8.h),
              Obx(
                () => passwordTextFIeld(),
              ),
              Gap(16.h),
              GestureDetector(
                onTap: () {
                  controller.authLogin();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.blueColorPrimary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.r),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField passwordTextFIeld() {
    return TextField(
      controller: controller.passwordController,
      keyboardType: TextInputType.text,
      obscureText: controller.isObscure.value,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            controller.toogleEye();
          },
          child: controller.isObscure.value
              ? const Icon(FluentIcons.eye_24_regular)
              : const Icon(FluentIcons.eye_off_24_regular),
        ),
        hintText: '********',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
      ),
    );
  }

  TextField usernameTextField() {
    return TextField(
      controller: controller.usernameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: 'Enter your username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade400,
            width: 2.w,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
          gapPadding: 2.0.h,
        ),
      ),
    );
  }
}
