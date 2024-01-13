import 'package:Pawonkoe/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


class CardDashboard extends StatelessWidget {
  Color? backgroundCardColor;
  String? nameCard;
  String? valueCard;
  Icon? iconCard;
  Color? backgroundIconColor;
  CardDashboard(
      {required this.backgroundCardColor,
      required this.backgroundIconColor,
      required this.iconCard,
      required this.nameCard,
      required this.valueCard,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundCardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundIconColor,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Icon(
                iconCard!.icon,
                size: 32.sp,
                color: Colors.white,
              ),
            ),
          ),
          Gap(12.h),
          Text(
            nameCard!,
            style: TextStyle(
              color: AppColors.labelTextColor,
              fontSize: 14.sp,
            ),
          ),
          Gap(10.h),
          Text(
            valueCard!,
            style: TextStyle(
              color: AppColors.primaryTextColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
