import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
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
        child: Stack(
          children: [
            Obx(
              () => Opacity(
                opacity: controller.loading.value ? 0.4 : 1.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Obx(
                    () => Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: controller.formKey.value,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(40),
                          Center(
                            child: Lottie.asset(
                              'assets/images/animation/admin.json',
                              width: 320.w,
                            ),
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 32.sp,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Login to continue using the app',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.secondaryTextColor,
                              fontWeight: FontWeight.w600,
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
                          Gap(4.h),
                          usernameTextField(),
                          Gap(2.h),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(4.h),
                          Obx(() => passwordTextField()),
                          Gap(16.h),
                          GestureDetector(
                            onTap: () {
                              if (controller.formKey.value.currentState
                                      ?.validate() ??
                                  false) {
                                controller.authLogin();
                              }
                              // Validate successful, proceed with login
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
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
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(16.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => controller.loading.value
                  ? Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColorSecoundary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.r),
                          ),
                        ),
                        child: Lottie.asset(
                          'assets/images/animation/loading.json',
                          width: 100.w,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password Tidak Boleh Kosong';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.passwordController,
      keyboardType: TextInputType.text,
      obscureText: controller.isObscure.value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
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

  TextFormField usernameTextField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username Tidak Boleh Kosong';
        }
        return null;
      },
      controller: controller.usernameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade200,
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
